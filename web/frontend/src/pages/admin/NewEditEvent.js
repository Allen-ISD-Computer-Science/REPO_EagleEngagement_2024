import * as React from "react";
import dayjs from "dayjs";

import { DateTimePicker, TimePicker } from "@mui/x-date-pickers";
import { ToastContainer, toast } from 'react-toastify';

import AdminNav from "../../components/AdminNav";
import { Autocomplete, Button, MenuItem, Select, TextField } from "@mui/material";

function NewEditEventPage(props) {
  const [title, setTitle] = React.useState("New Event");

  const [eventInfo, setEventInfo] = React.useState({
    name: "B.E.S.T. Robotics State Competition", description: "Come visit for the B.E.S.T. Robotics Competition!", eventType: "Robotics", locationName: "Allen Stadium", locationID: 0, startDate: "9/1/2021", points: 3, checkInType: "manual"
  });

  const [eventTypes, setEventTypes] = React.useState([
    "Football", "Soccer", "Robotics"
  ]);

  const [requests, setRequests] = React.useState([]);

  function addRequest (name) {
    const reqCopy = requests;
    reqCopy.push(name);
    setRequests(reqCopy);
  }

  const removeRequest = (name) => {
    const reqCopy = requests;
    reqCopy.splice(reqCopy.indexOf(name));
    setRequests(reqCopy);
  }

  React.useEffect(() => {
    const getEventTypes = async () => {
	const res = await fetch(`${process.env.PUBLIC_URL}/admin/api/eventTypes`, { headers: { Accept: "application/json" }, method: "POST" });
      return await res.json();
    }

    addRequest("eventTypes")
    getEventTypes().then((types) => {
      setEventTypes(types);
      removeRequest("eventTypes");
    }).catch((err) => {
      removeRequest("eventTypes");
    })
    
    const eventID = parseInt(window.location.pathname.split("/").pop());
    if (!isNaN(eventID)) {
      setTitle("Edit Event - ...");

      const getEvent = async () => {
          const res = await fetch(`${process.env.PUBLIC_URL}/admin/api/event/${eventID}`, { headers: { Accept: "application/json" }, method: "POST" });
          return await res.json();
      }

      addRequest("event");
      getEvent().then((event) => {
        document.title = "Edit Event - " + event.name;
        setTitle("Edit Event - " + event.name);
        setEventInfo(event);
        removeRequest("event");
      }).catch((err) => {
        removeRequest("event");
        // console.error(err);
      });

      return;
    }

    if (window.location.pathname !== "/admin/events/new") throw new Error("Invalid event ID.");
    setEventInfo({
      name: "",
      description: "",
      eventType: "",
      locationName: "",
      locationID: -1,
      checkInType: "",
      points: -1,
      startDate: "",
      endDate: ""
    });
  }, []);

  const saveButtonClicked = () => {
    var urlPath = "/admin/api/events/new"
    if (window.location.pathname !== "/admin/events/new") {
      const eventID = parseInt(window.location.pathname.split("/").pop());
      urlPath = `/admin/api/events/${eventID}/edit`
    }

    const filteredInfo = eventInfo;
    delete filteredInfo.location;

    const keys = Object.keys(filteredInfo);
    for (let i = 0; i < keys.length; i++) {
      const key = keys[i];
      if (!filteredInfo[key] || filteredInfo[key] === -1) {
        toast.error(`${key} cannot be empty!`, {
          position: "top-right",
          autoClose: 2000,
          closeOnClick: true,
          pauseOnHover: true,
          theme: "light"
        });
        return;
      }
    }

    fetch(`${process.env.PUBLIC_URL}${urlPath}`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify(filteredInfo)
    });
  }

  return (
    <div className="flex flex-row items-stretch min-h-[100vh]">
      <AdminNav selected="events" />
      <div className="flex flex-col items-stretch w-full">
        <div className="flex flex-col justify-center text-white text-5xl font-bold bg-blue-950 w-full pl-12 pr-12 items-start max-md:text-4xl max-md:px-5 h-[150px] max-md:max-h-[100px]">
          <span className="my-auto">
            {title}
          </span>
        </div>
        {/* Start a form, split it into two columns */}
        <form className="flex flex-row relative justify-between items-stretch p-10 gap-10 max-md:flex-col max-md:gap-4 max-md:p-4">
          <ToastContainer
            position="top-right"
            autoClose={2000}
            hideProgressBar={false}
            newestOnTop
            closeOnClick
            pauseOnFocusLoss
            pauseOnHover
            theme="light"
          />

          {/* Left column */}
          <div className="flex-1">
            <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="name">
              Event Name
            </label>
            <TextField
              className="border bg-gray-100 rounded-xl w-full"
              placeholder="Event Name"
              name="name"
              value={eventInfo.name}
              onChange={(e) => {
                setEventInfo({
                  ...eventInfo,
                  name: e.currentTarget.value
                })
              }}
            />

            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="type">
              Event Type
            </label>
            <Autocomplete
              className="border bg-gray-100 rounded-xl w-full"
              name="type"
              options={eventTypes}
              value={eventInfo.eventType}
              onChange={(e) => {
                setEventInfo({
                  ...eventInfo,
                  eventType: eventTypes[e.target.value]
                });
              }}
              onBlur={(e) => {
                if (eventInfo.eventType !== e.target.value) {
                  setEventInfo({
                    ...eventInfo,
                    eventType: e.target.value
                  });
                }
              }}
              freeSolo
              renderInput={params => <TextField {...params} />}
            />

            <div className="relative">
              <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="description">
                Description
              </label>
              <TextField
                className="border bg-gray-100 rounded-xl w-full"
                placeholder="Description"
                name="description"
                maxLength={255}
                value={eventInfo.description}
                onChange={(e) => {
                  setEventInfo({
                    ...eventInfo,
                    description: e.currentTarget.value
                  })
                  // TODO: add #/255
                }}
              />
            </div>

            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="location">
              Event Location
            </label>
            <Select
              className="border bg-gray-100 rounded-xl w-full"
              name="location"
              value={eventInfo.locationID}
              onChange={(e, val) => {
                setEventInfo({
                  ...eventInfo,
                  location: val.props.children,
                  locationID: parseInt(e.target.value)
                })
              }}
            >
              <MenuItem value="0">Allen Stadium</MenuItem>
              <MenuItem value="1">AHS PAC</MenuItem>
              <MenuItem value="2">Plano</MenuItem>
            </Select>

            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="checkInType">
              Check-In Type
            </label>
            <Select
              className="border bg-gray-100 rounded-xl w-full"
              name="checkInType"
              value={eventInfo.checkInType}
              onChange={(e) => {
                setEventInfo({
                  ...eventInfo,
                  checkInType: e.target.value
                })
              }}
            >
              <MenuItem value="location">Location</MenuItem>
              <MenuItem value="manual">Manual</MenuItem>
              <MenuItem value="photo">Photo</MenuItem>
            </Select>

            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="points">
              Points
            </label>
            <TextField
              className="border bg-gray-100 rounded-xl w-full"
              placeholder="Points"
              type="number"
              name="points"
              value={eventInfo.points === -1 ? "" : eventInfo.points}
              onChange={(e) => {
                setEventInfo({
                  ...eventInfo,
                  points: e.currentTarget.value
                })
              }}
            />
          </div>

          {/* Right column */}
          <div className="flex-1">
            <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="startDate">
              Start Date & Time
            </label>
            <DateTimePicker
              className="border bg-gray-100 rounded-xl w-full"
              value={dayjs(eventInfo.startDate)}
              onChange={(newValue) => {
                setEventInfo({
                  ...eventInfo,
                  startDate: newValue
                })
              }}
            />

            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="endTime">
              End Time
            </label>
            <TimePicker
              className="border bg-gray-100 rounded-xl w-full"
              value={dayjs(eventInfo.endDate)}
              onChange={(newValue) => {
                setEventInfo({
                  ...eventInfo,
                  endDate: newValue
                })
              }}
            />

            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="image">
              Event Image (Optional)
            </label>
            <Button
              variant="contained"
              component="label"
            >
              Upload File
              <input
                type="file"
                hidden
              />
            </Button>

            <br />

            <div
              className="flex flex-row-reverse items-end gap-4 mt-4 w-full mt-20"
            >
              {/* Submit button */}
              <Button
                variant="contained"
                color="success"
                onClick={() => { saveButtonClicked(); }}
              >
                Save
              </Button>

              {/* Cancel button */}
              <Button
                variant="contained"
                color="error"
                component="a"
                href={process.env.PUBLIC_URL + "/admin/events"}
              >
                Cancel
              </Button>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}

export default NewEditEventPage;

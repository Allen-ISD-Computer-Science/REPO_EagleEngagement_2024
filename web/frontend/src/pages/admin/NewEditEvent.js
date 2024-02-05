import * as React from "react";

import { DateTimePicker, TimePicker } from "@mui/x-date-pickers";

import AdminNav from "../../components/AdminNav";
import { Button, MenuItem, Select, TextField } from "@mui/material";

function NewEditEventPage(props) {
  const [title, setTitle] = React.useState("New Event");

  const [eventInfo, setEventInfo] = React.useState({
    name: "B.E.S.T. Robotics State Competition", location: "Allen Football Stadium", date: "9/1/2021", checkInType: "manual"
  });

  React.useEffect(() => {
    const eventID = parseInt(window.location.pathname.split("/").pop());
    console.log(eventID);
    if (!isNaN(eventID)) {
      setTitle("Edit Event - ...");

      const getEvent = async () => {
        const res = await fetch("./api/event/" + eventID);
        return await res.json();
      }

      getEvent().then((event) => {
        document.title = "Edit Event - " + event.name;
        setTitle("Edit Event - " + event.name);
        setEventInfo([event]);
      }).catch((err) => {
        // console.error(err);
      });

      return;
    }

    if (window.location.pathname !== "/admin/events/new") throw new Error("Invalid event ID.");
    setEventInfo({});
  }, []);

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
        <form className="flex flex-row justify-between items-stretch p-10 gap-10 max-md:flex-col max-md:gap-4 max-md:p-4">

          {/* Left column */}
          <div className="flex-1">
            <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="name">
              Event Name
            </label>
            <TextField
              className="border bg-gray-100 rounded-xl w-full"
              placeholder="Event Name"
              name="name"
            />

            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="type">
              Event Type
            </label>
            <Select
              className="border bg-gray-100 rounded-xl w-full"
              name="type"
            >
              <MenuItem value="football">Football</MenuItem>
              <MenuItem value="soccer">Soccer</MenuItem>
              <MenuItem value="basketball">Basketball</MenuItem>
            </Select>

            <div className="relative">
              <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="description">
                Description
              </label>
              <TextField
                className="border bg-gray-100 rounded-xl w-full"
                placeholder="Description"
                name="description"
                maxLength={255}
                onChange={(e) => {
                  // Max length of 255 characters update
                }}
              />
            </div>

            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="location">
              Event Location
            </label>
            <Select
              className="border bg-gray-100 rounded-xl w-full"
              name="location"
            >
              <MenuItem value="ahsfootball">Allen Stadium</MenuItem>
              <MenuItem value="plano">Plano</MenuItem>
              <MenuItem value="frisco">Frisco</MenuItem>
            </Select>

            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="checkInType">
              Check-In Type
            </label>
            <Select
              className="border bg-gray-100 rounded-xl w-full"
              name="checkInType"
            >
              <option value="location">Location</option>
              <option value="manual">Manual</option>
              <option value="photo">Photo</option>
            </Select>

            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="points">
              Points
            </label>
            <TextField
              className="border bg-gray-100 rounded-xl w-full"
              placeholder="Points"
              type="number"
              name="points"
            />
          </div>

          {/* Right column */}
          <div className="flex-1">
            <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="startDate">
              Start Date & Time
            </label>
            <DateTimePicker
              className="border bg-gray-100 rounded-xl w-full"
            />

            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="endTime">
              End Time
            </label>
            <TimePicker
              className="border bg-gray-100 rounded-xl w-full"
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
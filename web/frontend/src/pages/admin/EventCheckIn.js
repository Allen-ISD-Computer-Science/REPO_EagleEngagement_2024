import * as React from "react";

import AdminNav from "../../components/AdminNav";

import { Container } from "@mui/material";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEdit } from "@fortawesome/free-solid-svg-icons";

function EventCheckInPage(props) {
  const [eventInfo, setEventInfo] = React.useState({
    id: 1, name: "Senior Class Meeting", points: 15, description: "Important information for seniors!", date: "9/1/2021", startTime: "8:00 AM", endTime: "4:00 PM", checkInType: "manual"
  });

  React.useEffect(() => {
    const eventID = parseInt(window.location.pathname.split("/").pop());
    if (!isNaN(eventID)) {     
      const getEvent = async () => {
        const res = await fetch("./api/event/" + eventID);
        return await res.json();
      }

      getEvent().then((event) => {
        document.title = "Event CheckIn - " + event.name;
        setEventInfo(event);
      }).catch((err) => {
        // console.error(err);
      });
      
      return;
    }

    setEventInfo({});
    throw new Error("Invalid event ID.");
  }, []);

  return (
    <div className="flex flex-row items-stretch min-h-[100vh]">
      <AdminNav />
      <div className="flex flex-col items-stretch w-full">
        <div className="flex flex-col justify-center text-white text-6xl font-bold bg-blue-950 w-full pl-12 pr-12 items-start max-md:text-4xl max-md:px-5 h-[150px] max-md:max-h-[100px]">
          <span className="my-auto">
            Event Check In
          </span>
        </div>

        <div className="mt-10 gap-2 px-4 mx-[25%] flex flex-col justify-center items-start bg-gray-100 shadow relative flex-1 max-md:mx-2 rounded-xl">
          <a href={process.env.PUBLIC_URL + "/admin/events/edit/" + eventInfo.id} className="absolute top-4 right-4">
            <FontAwesomeIcon icon={faEdit} size="2xl"></FontAwesomeIcon>
          </a>
          <h1 className="text-4xl max-md:text-2xl font-bold">{eventInfo.name}</h1>
          <h2 className="text-2xl max-md:text-xl">Points: {eventInfo.points}</h2>
          <h2 className="text-2xl nax-md:text-xl">Description:</h2>
          <p className="text-lg max-md:text-base">{eventInfo.description}</p>
          <h2 className="text-2xl max-md:text-xl">
            {eventInfo.date} <br /> {eventInfo.startTime} - {eventInfo.endTime}
          </h2>
          <h2 className="text-2xl max-md:text-xl">Check In Type: {eventInfo.checkInType}</h2>
        </div>

        <div className="mx-[25%] flex flex-row justify-center items-center relative flex-1 max-md:flex-col max-md:gap-2">
          <Container className="flex flex-col justify-start items-center relative">
            <h2 className="text-2xl max-md:text-xl">Student ID:</h2>
            <input
              type="text"
              className="border border-gray-400 rounded-xl p-2 w-full"
              onKeyDown={(e) => {
                if (e.key === "Enter") {
                  // Handle Check In Btn click
                }
              }}
            />
          </Container>
          <button className="bg-blue-600 text-white px-4 py-2 rounded-xl mt-4 text-2xl max-md:text-xl font-bold whitespace-nowrap">Check In</button>
        </div>

      </div>
    </div>
  );
}

export default EventCheckInPage;
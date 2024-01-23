import * as React from "react";

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faEdit, faIdCard, faPlus, faSearch, faTrash } from '@fortawesome/free-solid-svg-icons'

import AdminNav from "../../components/AdminNav";

function EventsPage(props) {
  const [events, setEvents] = React.useState([
    { id: 1, name: "B.E.S.T. Robotics State Competition", location: "Allen Football Stadium", date: "9/1/2021", checkInType: "manual" },
  ]);

  return (
    <div className="flex flex-row items-stretch min-h-[100vh] z-[100]">
      <AdminNav />
      <div className="flex flex-col items-stretch w-full">
        <div className="flex flex-col justify-center text-white text-6xl font-bold bg-blue-950 w-full pl-12 pr-12 items-start max-md:text-4xl max-md:px-5 h-[150px] max-md:max-h-[100px]">
          <span className="my-auto">
            Events
          </span>
        </div>
        <div
          className="flex flex-row justify-between items-stretch max-md:flex-col px-16 pt-8 max-md:p-4"
        >
          <div
            id="searchBox"
            className="flex flex-row justify-start items-stretch gap-4 w-1/2 [&>*]:self-stretch max-md:w-full max-md:flex-col max-md:gap-2"
          >
            <input
              type="text"
              className="border bg-gray-100 border-slate-600 rounded-xl p-2 w-full"
              placeholder="Search"
            />
            <button
              className="bg-blue-950 text-white px-4 py-2 rounded-xl"
            >
              <FontAwesomeIcon icon={faSearch} size="xl" />
            </button>
          </div>
          <div className="max-md:mt-6 max-md:w-full">
            <button
              className="bg-blue-950 text-white px-4 py-2 rounded-xl font-semibold max-md:w-full"
            >
              <a
                href={process.env.PUBLIC_URL + "/admin/events/new"}
              >
                <FontAwesomeIcon icon={faPlus} size="m" className="mr-2" />
                Create Event
              </a>
            </button>
          </div>
        </div>
        <div
          className="pt-8 px-16 w-full max-md:pt-4 max-md:px-4">
          <table
            className="w-full bg-blue-900 text-white table-fixed text-center border border-slate-400 [&_th]:border-slate-400 [&_td]:border-slate-400 [&_th]:border-r [&_td]:border-r [&_th]:p-2 [&_td]:p-2"
          >
            <thead className="border-b border-slate-400">
              {/* date, number of students, and actions columns */}
              <tr className="text-xl font-bold">
                <th>Name</th>
                <th>Location</th>
                <th>Date</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody className="border-b border-slate-400">
              {/* meeting logs */}
              {
                events.map((event, i) =>
                    <tr key={event.id} className="text-l">
                      <td>{event.name}</td>
                      <td>{event.location}</td>
                      <td>{event.date}</td>
                      <td className="[&>*]:mx-4">
                        <a className="bg-blue-950 text-white px-4 py-2 rounded-xl" href={process.env.PUBLIC_URL + `/admin/events/edit/${event.id}`}>
                          <FontAwesomeIcon icon={faEdit} size="m" />
                        </a>
                        {
                          event.checkInType === "manual" ? <a href={process.env.PUBLIC_URL + `/admin/events/checkin/${event.id}`} className="bg-blue-950 text-white px-4 py-2 rounded-xl"><FontAwesomeIcon icon={faIdCard} size="m" /></a> : ""
                        }
                        <button className="bg-blue-950 text-white px-4 py-2 rounded-xl"><FontAwesomeIcon icon={faTrash} size="m" /></button>
                      </td>
                    </tr>
                )
              }
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default EventsPage;
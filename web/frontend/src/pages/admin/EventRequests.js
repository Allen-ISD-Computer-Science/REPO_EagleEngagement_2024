import * as React from "react";

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faCheck, faSearch, faTrash } from '@fortawesome/free-solid-svg-icons'

import AdminNav from "../../components/AdminNav";

function EventRequestsPage(props) {
  const [eventRequests, setEventRequests] = React.useState([
    { name: "B.E.S.T. Robotics State Competition", date: "9/1/2021" },
  ]);

  return (
    <div className="flex flex-row items-stretch min-h-[100vh]">
      <AdminNav selected="event-requests" />
      <div className="flex flex-col items-stretch w-full">
        <div className="flex flex-col justify-center text-white text-5xl font-bold bg-blue-950 w-full pl-12 pr-12 items-start max-md:text-4xl max-md:px-5 h-[150px] max-md:max-h-[100px]">
          <span className="my-auto">
            Event Requests
          </span>
        </div>
        <div
          id="searchBox"
          className="flex flex-row justify-start items-stretch pl-16 pt-8 gap-4 w-1/2 [&>*]:self-stretch max-md:w-full max-md:flex-col max-md:gap-2 max-md:p-4"
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
        <div
          className="pt-8 px-16 w-full max-md:pt-4 max-md:px-4">
          <table
            className="w-full bg-blue-900 text-white table-fixed text-center border border-slate-400 [&_th]:border-slate-400 [&_td]:border-slate-400 [&_th]:border-r [&_td]:border-r [&_th]:p-2 [&_td]:p-2"
          >
            <thead className="border-b border-slate-400">
              {/* date, number of students, and actions columns */}
              <tr className="text-xl font-bold">
                <th>Name</th>
                <th>Date</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody className="border-b border-slate-400">
              {/* meeting logs */}
              {
                eventRequests.map((eventReq, i) =>
                  <tr key={i} className="text-l">
                    <td>{eventReq.name}</td>
                    <td>{eventReq.date}</td>
                    <td className="[&_button]:mx-4">
                      <button className="bg-blue-950 text-white px-4 py-2 rounded-xl"><FontAwesomeIcon icon={faCheck} size="lg" /></button>
                      <button className="bg-blue-950 text-white px-4 py-2 rounded-xl"><FontAwesomeIcon icon={faTrash} size="lg" /></button>
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

export default EventRequestsPage;
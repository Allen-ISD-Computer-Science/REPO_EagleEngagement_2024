import * as React from "react";

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faSearch } from '@fortawesome/free-solid-svg-icons'

import AdminNav from "../../components/AdminNav";
import MissingPointsCarousel from "../../components/MissingPointsCarousel";

function MissingPointsRequestsPage(props) {
  return (
    <div className="flex flex-row items-stretch min-h-[100vh]">
      <AdminNav selected="missing-points" />
      <div className="flex flex-col items-stretch w-full">
        <div className="flex flex-col justify-center text-white text-5xl font-bold bg-blue-950 w-full pl-12 pr-12 items-start max-md:text-4xl max-md:px-5 h-[150px] max-md:max-h-[100px]">
          <span className="my-auto">
            Missing Points Requests
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
          <MissingPointsCarousel />
        </div>
      </div>
    </div>
  );
}

export default MissingPointsRequestsPage;
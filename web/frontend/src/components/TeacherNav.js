import * as React from "react";

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlus, faUsers } from '@fortawesome/free-solid-svg-icons'

function TeacherNav(props) {
  return (
    <nav className="items-stretch bg-blue-950 flex max-w-[400px] w-full flex-col pb-12">
      <img
        loading="lazy"
        srcSet={process.env.PUBLIC_URL + "/assets/images/logo.png"}
        alt="Eagle Engagement Logo"
        className="object-contain object-center w-full fill-white overflow-hidden shrink-0 max-w-full max-h-[150px] max-md:max-h-[100px] bg-[#001058] shadow-[4.0px_8.0px_8.0px_rgba(0,0,0,0.2)]"
      />
      <div className="justify-between items-center flex flex-col text-white text-right [&_span]:text-3xl [&_span]:font-bold [&_span:hover]:underline">
        <a 
          href={process.env.PUBLIC_URL + "/dashboard"}
          className="items-stretch mt-12 px-6 flex flex-row [&>*]:flex-1 [&>*]:mx-4 [&>span]:h-full [&>*]:items-center [&>*]:justify-center"
        >
          <FontAwesomeIcon icon={faUsers} size="2xl" />
          <span>
            Clubs
          </span>
        </a>
        <div className="items-stretch mt-12 px-6">
        <a 
          href={process.env.PUBLIC_URL + "/event-request"}
          className="items-stretch mt-12 px-6 flex flex-row [&>*]:flex-1 [&>*]:mx-4 [&>span]:h-full [&>*]:items-center [&>*]:justify-center"
        >
          <FontAwesomeIcon icon={faPlus} size="2xl" />
          <span>
            Event Request
          </span>
        </a>
        </div>
      </div>
    </nav>
  );
}

export default TeacherNav;
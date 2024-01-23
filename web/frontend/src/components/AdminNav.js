import * as React from "react";

import { useCookies } from 'react-cookie';

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faCalendar, faCaretDown, faCaretUp, faImage, faLocationDot, faPlus, faQuestion, faUsers } from '@fortawesome/free-solid-svg-icons'

function AdminNav(props) {

  const [cookies, setCookie] = useCookies(['admin-config']);

  return (
    <nav className="items-stretch bg-blue-950 flex max-w-[400px] w-full flex-col pb-12 max-md:hidden">
      <img
        loading="lazy"
        srcSet={process.env.PUBLIC_URL + "/assets/images/logo.png"}
        alt="Eagle Engagement Logo"
        className="object-contain object-center w-full fill-white overflow-hidden shrink-0 max-w-full max-h-[150px] max-md:max-h-[100px] bg-[#001058] shadow-[4.0px_8.0px_8.0px_rgba(0,0,0,0.2)]"
      />
      <div className="justify-between items-center flex flex-col text-white text-right [&_*]:text-3xl [&_*]:font-bold [&_span:hover]:underline">
        <div>
          <button
            className="items-stretch mt-12 px-6 flex flex-row [&>*]:flex-1 [&>*]:mx-4 [&>span]:h-full [&>*]:items-center [&>*]:justify-center"
            onClick={() => {
              setCookie('admin-config', cookies['admin-config'] === "down" ? "up" : "down");
            }}
          >
            <FontAwesomeIcon icon={faUsers} size="2xl" />
            <p>
              Manage
            </p>
            <FontAwesomeIcon icon={cookies['admin-config'] === "down" ? faCaretDown : faCaretUp} size="2xl"/>
          </button>
          <div className={"ml-6" + (cookies['admin-config'] === "down" ? " hidden" : "")}>
            <a
              href={process.env.PUBLIC_URL + "/admin/eventRequests"}
              className="items-stretch mt-12 px-6 flex flex-row [&>*]:flex-1 [&>*]:mx-4 [&>span]:h-full [&>*]:items-center [&>*]:justify-center"
            >
              <FontAwesomeIcon icon={faPlus} size="2xl" />
              <span>
                Event Requests
              </span>
            </a>
            <a
              href={process.env.PUBLIC_URL + "/admin/reviewCheckIns"}
              className="ml-10 items-stretch mt-12 px-6 flex flex-row [&>*]:flex-1 [&>*]:mx-4 [&>span]:h-full [&>*]:items-center [&>*]:justify-center"
            >
              <FontAwesomeIcon icon={faImage} size="2xl" />
              <span>
                Review CheckIns
              </span>
            </a>
            <a
              href={process.env.PUBLIC_URL + "/admin/reviewMissingPoints"}
              className="ml-10 items-stretch mt-12 px-6 flex flex-row [&>*]:flex-1 [&>*]:mx-4 [&>span]:h-full [&>*]:items-center [&>*]:justify-center"
            >
              <FontAwesomeIcon icon={faQuestion} size="2xl" />
              <span>
                Review Missing
              </span>
            </a>
          </div>
        </div>
        <div className="items-stretch px-6">
        <a 
          href={process.env.PUBLIC_URL + "/admin/events"}
          className="items-stretch mt-12 px-6 flex flex-row [&>*]:flex-1 [&>*]:mx-4 [&>span]:h-full [&>*]:items-center [&>*]:justify-center"
        >
          <FontAwesomeIcon icon={faCalendar} size="2xl" />
          <span>
            Events
          </span>
        </a>
        <a 
          href={process.env.PUBLIC_URL + "/admin/locations"}
          className="items-stretch mt-12 px-6 flex flex-row [&>*]:flex-1 [&>*]:mx-4 [&>span]:h-full [&>*]:items-center [&>*]:justify-center"
        >
          <FontAwesomeIcon icon={faLocationDot} size="2xl" />
          <span>
            Locations
          </span>
        </a>
        </div>
      </div>
    </nav>
  );
}

export default AdminNav;
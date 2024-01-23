import * as React from "react";

import { List, ListItemButton, ListItemIcon, ListItemText } from "@mui/material"

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faBars, faPlus, faUsers } from '@fortawesome/free-solid-svg-icons'

function TeacherNav(props) {
  const [isHidden, setIsHidden] = React.useState(true);

  return (
    <div>
      <button
        onClick={() => setIsHidden(!isHidden)}
        className="absolute bg-blue-900 py-2 px-3 rounded-2xl hover:bg-blue-800 top-2 right-2 z-50 text-white hidden max-md:block"
      >
        <FontAwesomeIcon icon={faBars} size="2xl" />
      </button>
      <nav className={`items-stretch bg-blue-950 flex max-w-[400px] w-full h-full flex-col pb-12 max-md:${isHidden ? "hidden" : "block"} max-md:w-full max-md:absolute max-md:max-w-full`}>
        <img
          loading="lazy"
          srcSet={process.env.PUBLIC_URL + "/assets/images/logo.png"}
          alt="Eagle Engagement Logo"
          className="object-contain object-center w-full fill-white overflow-hidden shrink-0 max-w-full max-h-[150px] max-md:max-h-[100px] bg-[#001058] shadow-[4.0px_8.0px_8.0px_rgba(0,0,0,0.2)]"
        />
        <List className="[&_a]:mb-4 [&_span]:text-2xl [&_span]:text-center [&_*]:!text-white [&_*]:!font-semibold">
          <ListItemButton component="a" href={process.env.PUBLIC_URL + "/dashboard"} selected={props.selected === "clubs"}>
            <ListItemIcon className="flex-col items-center">
              <FontAwesomeIcon icon={faUsers} size="2xl" />
            </ListItemIcon>
            <ListItemText primary="Clubs" />
          </ListItemButton>

          <ListItemButton component="a" href={process.env.PUBLIC_URL + "/event-request"} selected={props.selected === "event-request"}>
            <ListItemIcon className="flex-col items-center">
              <FontAwesomeIcon icon={faPlus} size="2xl" />
            </ListItemIcon>
            <ListItemText primary="Event Request" />
          </ListItemButton>
        </List>
      </nav>
    </div>
  );
}

export default TeacherNav;
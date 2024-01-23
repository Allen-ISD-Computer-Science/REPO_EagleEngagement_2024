import * as React from "react";

import { Collapse, List, ListItemButton, ListItemIcon, ListItemText } from "@mui/material"

import { useCookies } from 'react-cookie';

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faCalendar, faCaretDown, faCaretUp, faImage, faLocationDot, faPlus, faQuestion, faUsers, faBars } from '@fortawesome/free-solid-svg-icons'

function AdminNav(props) {
  const [isHidden, setIsHidden] = React.useState(true);

  const [cookies, setCookie] = useCookies(['admin-config']);
  const [openCollapse, setOpenCollapse] = React.useState(cookies["admin-config"] === "down" ? false : true);    

  const handleOpenManage = () => {
    setCookie(cookies["admin-config"] === "down" ? "up" : "down");
    setOpenCollapse(!openCollapse);
  }

  return (
    <div>
      <button
        onClick={() => setIsHidden(!isHidden)}
        className="absolute bg-blue-900 py-2 px-3 rounded-2xl hover:bg-blue-800 top-2 right-2 z-50 text-white hidden max-md:block"
      >
        <FontAwesomeIcon icon={faBars} size="2xl" />
      </button>
      <nav className={`h-full items-stretch bg-blue-950 flex max-w-[400px] z-40 w-full flex-col pb-12 ${isHidden ? "max-md:hidden" : "max-md:block"} max-md:w-full max-md:absolute max-md:max-w-full`}>
        <img
          loading="lazy"
          srcSet={process.env.PUBLIC_URL + "/assets/images/logo.png"}
          alt="Eagle Engagement Logo"
          className="object-contain object-center w-full fill-white overflow-hidden shrink-0 max-w-full max-h-[150px] max-md:max-h-[100px] bg-[#001058] shadow-[4.0px_8.0px_8.0px_rgba(0,0,0,0.2)]"
        />
        <List className="[&_a]:mb-4 [&_span]:text-2xl [&_span]:text-center [&_*]:!text-white [&_*]:!font-semibold">
          <ListItemButton component="a" onClick={handleOpenManage}>
            <ListItemIcon className="flex-col items-center">
              <FontAwesomeIcon icon={faUsers} size="2xl" />
            </ListItemIcon>
            <ListItemText primary="Manage" />
            { openCollapse ? <FontAwesomeIcon icon={faCaretUp} size="2xl" /> : <FontAwesomeIcon icon={faCaretDown} size="2xl" /> }
          </ListItemButton>
          <Collapse in={openCollapse} timeout="auto" className="ml-8" unmountOnExit>
            <List component="div" disablePadding>
              <ListItemButton component="a" href={process.env.PUBLIC_URL + "/admin/eventRequests"} selected={props.selected === "event-requests"}>
                <ListItemIcon className="flex-col items-center">
                  <FontAwesomeIcon icon={faPlus} size="2xl" />
                </ListItemIcon>
                <ListItemText primary="Event Requests" />
              </ListItemButton>
              <ListItemButton component="a" href={process.env.PUBLIC_URL + "/admin/reviewCheckIns"} selected={props.selected === "check-ins"}>
                <ListItemIcon className="flex-col items-center">
                  <FontAwesomeIcon icon={faImage} size="2xl" />
                </ListItemIcon>
                <ListItemText primary="Review CheckIns" />
              </ListItemButton>
              <ListItemButton component="a" href={process.env.PUBLIC_URL + "/admin/reviewMissingPoints"} selected={props.selected === "missing-points"}>
                <ListItemIcon className="flex-col items-center">
                  <FontAwesomeIcon icon={faQuestion} size="2xl" />
                </ListItemIcon>
                <ListItemText primary="Review Missing" />
              </ListItemButton>
            </List>
          </Collapse>
          <ListItemButton component="a" href={process.env.PUBLIC_URL + "/admin/events"} selected={props.selected === "events"}>
            <ListItemIcon className="flex-col items-center">
              <FontAwesomeIcon icon={faCalendar} size="2xl" />
            </ListItemIcon>
            <ListItemText primary="Events" />
          </ListItemButton>
          <ListItemButton component="a" href={process.env.PUBLIC_URL + "/admin/locations"} selected={props.selected === "locations"}>
            <ListItemIcon className="flex-col items-center">
              <FontAwesomeIcon icon={faLocationDot} size="2xl" />
            </ListItemIcon>
            <ListItemText primary="Locations" />
          </ListItemButton>
        </List>
      </nav>
    </div>
  );
}

export default AdminNav;
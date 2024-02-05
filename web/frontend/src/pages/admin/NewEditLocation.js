import * as React from "react";

import { Button, TextField } from "@mui/material";

import AdminNav from "../../components/AdminNav";
import MapSelector from "../../components/MapSelector";

function NewEditLocationPage(props) {
  const [title, setTitle] = React.useState("New Location");

  const [locationInfo, setLocationInfo] = React.useState({
    name: "Allen High School PAC", address: "300...", latitude: 33.1, longitude: -96.6, radius: 100
  });

  React.useEffect(() => {
    const locationID = parseInt(window.location.pathname.split("/").pop());
    console.log(locationID);
    if (!isNaN(locationID)) {
      setTitle("Edit Location - ...");

      const getLocation = async () => {
        const res = await fetch("./api/location/" + locationID);
        return await res.json();
      }

      getLocation().then((location) => {
        document.title = "Edit Location - " + location.name;
        setTitle("Edit Location - " + location.name);
        setLocationInfo(location);
      }).catch((err) => {
        // console.error(err);
      });

      return;
    }

    if (window.location.pathname !== "/admin/locations/new") throw new Error("Invalid location ID.");
    setLocationInfo({});
  }, []);

  return (
    <div className="flex flex-row items-stretch min-h-[100vh]">
      <AdminNav selected="locations" />
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
              Location Name
            </label>
            <TextField
              className="border bg-gray-100 rounded-xl w-full"
              placeholder="Location Name"
              name="name"
            />

            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="address">
              Address
            </label>
            <TextField
              className="border bg-gray-100 rounded-xl w-full"
              placeholder="Address"
              name="address"
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
                onChange={(e) => {
                  // Max length of 255 characters update
                }}
              />
            </div>
          </div>

          {/* Right column */}
          <div className="flex-1 flex flex-col">
            <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="map">
              Choose Location
            </label>
            <MapSelector />

            <br />

            <div
              className="flex-1 flex flex-row-reverse items-end gap-4 mt-4 w-full mt-20"
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
                href={process.env.PUBLIC_URL + "/admin/locations"}
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

export default NewEditLocationPage;
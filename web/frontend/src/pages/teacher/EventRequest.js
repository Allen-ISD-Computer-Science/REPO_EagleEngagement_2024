import * as React from "react";

import { DateTimePicker, TimePicker } from "@mui/x-date-pickers";

import AdminNav from "../../components/AdminNav";
import { Button, MenuItem, Select, TextField } from "@mui/material";

function EventRequestPage(props) {
  return (
    <div className="flex flex-row items-stretch min-h-[100vh]">
      <AdminNav selected="events" />
      <div className="flex flex-col items-stretch w-full">
        <div className="flex flex-col justify-center text-white text-5xl font-bold bg-blue-950 w-full pl-12 pr-12 items-start max-md:text-4xl max-md:px-5 h-[150px] max-md:max-h-[100px]">
          <span className="my-auto">
            Event Request
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
              
          </div>

          {/* Right column */}
          <div className="flex-1">
            <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="location-description">
              Event Location (include address)
            </label>
            <TextField
                className="border bg-gray-100 rounded-xl w-full"
                placeholder="Location Description"
                name="location-description"
                maxLength={1000}
            />

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

            <br />

            <div
              className="flex flex-row-reverse items-end gap-4 mt-4 w-full mt-20"
            >
              {/* Submit button */}
              <Button
                variant="contained"
                color="success"
              >
                Submit
              </Button>

              {/* Cancel button */}
              <Button
                variant="contained"
                color="error"
                component="a"
                href={process.env.PUBLIC_URL + "/dashboard"}
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

export default EventRequestPage;
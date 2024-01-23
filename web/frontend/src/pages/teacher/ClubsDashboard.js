import * as React from "react";

import TeacherNav from "../../components/TeacherNav";
import ClubCard from "../../components/ClubCard";

function ClubsDashboard(props) {
  return (
    <div className="flex flex-row items-stretch min-h-[100vh]">
      <TeacherNav selected="clubs" />
      <div className="flex flex-col items-stretch w-full">
        <div className="flex flex-col justify-center text-white text-6xl font-bold bg-blue-950 w-full pl-12 pr-12 items-start max-md:text-4xl max-md:px-5 h-[150px] max-md:max-h-[100px]">
          <span className="my-auto">
            Clubs
          </span>
        </div>
        
        <ClubCard 
          clubID="1"
          clubName="Allen Eagle Robotics"
          clubDescription="Allen Eagle Robotics is a club that focuses on building robots and competing in competitions..."
          clubFollowing="50"
          clubLastCheckIns="20"
        />
      </div>
    </div>
  );
}


export default ClubsDashboard;
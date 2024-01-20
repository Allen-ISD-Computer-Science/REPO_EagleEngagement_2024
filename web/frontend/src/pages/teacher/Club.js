import * as React from "react";

import TeacherNav from "../../components/TeacherNav";
import ClubCard from "../../components/ClubCard";

function ClubPage(props) {
  const [clubObj, setClubObj] = React.useState({});

  React.useEffect(() => {
    const clubID = parseInt(window.location.pathname.split("/").pop());
    if (isNaN(clubID)) throw new Error("Invalid club ID.");

    const getClub = async () => {
      const res = await fetch("./api/club/" + clubID);
      return await res.json();
    }

    getClub().then((club) => {
      document.title = "Club - " + club.name;
      setClubObj(club);
    }).catch((err) => {
      // console.error(err);
    });
  }, []);

  return (
    <div className="flex flex-row items-stretch min-h-[100vh]">
      <TeacherNav />
      <div className="flex flex-col items-stretch w-full">
        <div className="flex flex-col justify-center text-white text-6xl font-bold bg-blue-950 w-full pl-12 pr-12 items-start max-md:text-4xl max-md:px-5 h-[150px] max-md:max-h-[100px]">
          <span className="my-auto">
            Club - {clubObj.name}
          </span>
        </div>
        
        
      </div>
    </div>
  );
}


export default ClubPage;
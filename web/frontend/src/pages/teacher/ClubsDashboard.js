import * as React from "react";

import TeacherNav from "../../components/TeacherNav";
import ClubCard from "../../components/ClubCard";

function ClubsDashboard(props) {

	const searchRef  = React.useRef(null);

	const [requests, setRequests] = React.useState(0);

	const [showPast, setShowPast] = React.useState(false);
	const [filter, setFilter] = React.useState("");

	const [clubs, setClubs] = React.useState(null);

	React.useEffect(() => {
	    const getClubs = async () => {
		setRequests((prev) => prev + 1);

		const args = {
		    includePast: showPast
		};
		if (filter !== "") args.filterByName = filter;

		const res = await fetch(`${process.env.PUBLIC_URL}/faculty/api/clubs`, { headers: {
		    Accept: "application/json"
		}, method: "POST", body: JSON.stringify(args) });

		return await res.json();
	    }

	    getClubs().then((clubs) => {
		setClubs(clubs);
		setRequests((prev) => prev - 1);
	    }).catch((err) => {
		setRequests((prev) => prev - 1);
		console.error(err);
	    });
	}, [setClubs,setRequests])


	return (
	    <div className="flex flex-row items-stretch min-h-[100vh]">
		<TeacherNav selected="clubs" />
		<div className="flex flex-col items-stretch w-full">
		    <div className="flex flex-col justify-center text-white text-5xl font-bold bg-blue-950 w-full pl-12 pr-12 items-start max-md:text-4xl max-md:px-5 h-[150px] max-md:max-h-[100px]">
			<span className="my-auto">
			    Clubs
			</span>
		    </div>
		    {
			clubs?.map((club, i) =>
		    <ClubCard
			clubID={club.id}
			clubName={club.name}
			clubDescription={club.description}
			clubFollowing={club.studentsFollowing}
			clubLastCheckIns={club.lastCheckInCount}
		    />
			)}
		</div>
	    </div>
	);
    }


    export default ClubsDashboard;

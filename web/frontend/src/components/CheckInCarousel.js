import * as React from 'react';

import { faCheck, faX } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

import { LazyLoadImage } from 'react-lazy-load-image-component';

function CheckInCarousel(props) {

    const [isBlurred, setIsBlurred] = React.useState(false);

    const [checkIns, setCheckIns] = React.useState([
        { studentName: "Brett Kaplan", studentId: "123456", event: "Dress Up - Atheltic Gear", imageURL: "https://www.oneathletic.com/cdn/shop/files/one-athletic-tracksuit-running.jpg" },
        { studentName: "Testing User", studentId: "123456", event: "Dress Up - Atheltic Gear", imageURL: "https://www.oneathletic.com/cdn/shop/files/OA-101.jpg" },
        { studentName: "Other Kaplan", studentId: "123456", event: "Dress Up - Atheltic Gear", imageURL: "https://i.pinimg.com/474x/2c/59/67/2c59674a6afc97d7d239f824cc577567.jpg" },
    ]);
    const [chosenCheckIn, setChosenCheckIn] = React.useState(0);

    React.useEffect(() => {
        fetch(process.env.REACT_APP_API_URL + "/api/checkins")
        .then(response => response.json())
        .then(data => {
            setCheckIns(data);
        })
    }, []);

    return (
        <div
            className={`flex flex-col items-center justify-center gap-10 ${isBlurred ? "blur-sm" : "blur-none"}`}
            style={{ transition: "0.25s -webkit-filter linear" }}
        >
            <div className="text-4xl font-bold flex flex-row gap-0">
                <span className='text-left flex-1'>
                    {checkIns[chosenCheckIn].studentName}
                    <br />
                    {checkIns[chosenCheckIn].studentId}
                </span>
                <span className='text-right flex-1'>
                    {checkIns[chosenCheckIn].event}
                </span>
            </div>
            <LazyLoadImage
                id='checkInImage'
                alt={checkIns[chosenCheckIn].studentName + "'s Check-In"}
                src={checkIns[chosenCheckIn].imageURL}
                height={400}
                className='min-w-[225px] bg-gray-100 rounded-xl shadow-xl h-[400px]'
            />
            <div className='flex flex-row items-center justify-center gap-10'>
                <button
                    className='text-4xl font-bold text-green-600'
                    onClick={() => {
                        setIsBlurred(true);
                        setTimeout(() => {
                            if (chosenCheckIn > 0) {
                                setChosenCheckIn(chosenCheckIn - 1);
                            }
                            setIsBlurred(false);
                        }, 300);
                    }}
                >
                    <FontAwesomeIcon icon={faCheck} size='sm' />
                </button>
                <button
                    className='text-4xl font-bold text-red-600'
                    onClick={() => {
                        setIsBlurred(true);
                        setTimeout(() => {
                            if (chosenCheckIn < checkIns.length - 1) {
                                setChosenCheckIn(chosenCheckIn + 1);
                            }
                            setIsBlurred(false);
                        }, 300);
                    }}
                >
                    <FontAwesomeIcon icon={faX} size='sm' />
                </button>
            </div>
        </div>
    )
}

export default CheckInCarousel;
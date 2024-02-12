import { CircularProgress } from '@mui/material';
import * as React from 'react';

import "./LoadingOverlay.css"

function LoadingOverlay(props) {    
    return (
        <div className={`transition-opacity fixed left-0 top-0 w-full h-full flex justify-center items-center bg-opacity-35 bg-black block z-50 ${props.isActive ? "fadeIn" : "fadeOut"}`}>
            <div className='flex flex-col items-center'>
                <CircularProgress />
                <p className='text-white text-xl'>{props.text}</p>
            </div>
        </div>
    )

}

export default LoadingOverlay;

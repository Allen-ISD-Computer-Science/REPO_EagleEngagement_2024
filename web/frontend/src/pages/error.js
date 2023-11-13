import { useRouteError } from "react-router-dom";

import logo from '../logo.svg';
import './App.css';

function Error() {
    const error = useRouteError();
    console.error(error)
    
    return (
	    <div className="Error">
	    <h1>Oops!</h1>
	    <p>Sorry, an unexpected error has occurred.</p>
	    <p>
            <i>{error.statusText || error.message}</i>
	    </p> 
	    </div>
    );
}

export default Error;

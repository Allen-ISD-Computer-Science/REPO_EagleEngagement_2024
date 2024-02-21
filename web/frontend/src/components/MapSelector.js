import * as React from 'react';

import { MapContainer, TileLayer, Circle, useMapEvents } from 'react-leaflet'

import "leaflet/dist/leaflet.css";

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faSearch } from '@fortawesome/free-solid-svg-icons';
import { Slider } from '@mui/material';

function MapSelector(props) {
    function MapEvents() {
        const map = useMapEvents({
            click(e) {
		props.onChange(e.latlng, props.radius);
		map.flyTo(e.latlng, map.getZoom(), { animate: true });
            }
        })

        return null;
    }

    const [map, setMap] = React.useState(null);

    const [searchText, setSearchText] = React.useState("");

    const search = () => {
	const urlEncoded = encodeURI(searchText);
	fetch(`https://nominatim.openstreetmap.org/search?q=${urlEncoded}&format=json&countrycodes=us`, {
	    method: "GET",
	    headers: {
		"Accept": "application/json"
	    }
	})
	    .then(a => a.json())
	    .then(json => {
		const place = json[0];
		if (place && map) {
		    props.onChange({lat: place.lat, lng: place.lon}, props.radius);
		    map.flyTo({lat: place.lat, lng: place.lon}, map.getZoom(), { animate: true });
		}
	    })
	    .catch(err => {
		console.error(err);
	    });
    }

    const displayMap = React.useMemo(
	() => (
            <MapContainer center={{lat: 33.1097, lng: -96.6608}} zoom={13} scrollWheelZoom={true} ref={setMap}>
                <TileLayer
                    attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                    url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                />
                <Circle
                    center={{lat: props.lat, lng: props.lng}}
                    radius={props.radius}
                    fillColor='blue'
                />
                <MapEvents />
            </MapContainer>	    
	), [props.lat, props.lng, props.radius],
    )
      
    return (
        <div className="min-h-[400px] [&>*:first-child]:w-full [&>*:first-child]:h-full [&>*:first-child]:z-10 relative">
	    { displayMap }
            <div className='absolute top-2 left-[10%] w-[90%] w-50 h-12 z-50 flex flex-row items-center max-md:flex-col'>
                <div className="bg-gray-100 p-2 rounded-xl flex-1 max-w-fit z-40">
                    <input type="text" className='bg-transparent rounded-xl p-1 focus:outline-slate-300 w-[80%]' placeholder='Address' value={searchText} onChange={(e) => setSearchText(e.currentTarget.value)} />
                    <button className="text-slate-700 rounded-xl font-semibold ml-2 hover:text-black" type="button" onClick={search}>
                        <FontAwesomeIcon icon={faSearch} size="lg" className="mr-2" />
                    </button>
                </div>

                <Slider
                        className='mx-6 flex-1 max-md:max-w-[200px]'
                    defaultValue={props.radius}
		    value={props.radius}
                        getAriaValueText={(value) => value + 'm'}
                        valueLabelDisplay="auto"
                    onChange={(e, value) => props.onChange({lat: props.lat, lng: props.lng}, value)}
                        step={50}
                        min={50}
                        max={500}
                    />
            </div>
        </div>
    );
}

export default MapSelector;

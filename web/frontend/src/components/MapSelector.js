import * as React from 'react';

import { MapContainer, TileLayer, Circle, useMapEvents } from 'react-leaflet'

import "leaflet/dist/leaflet.css";

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faSearch } from '@fortawesome/free-solid-svg-icons';
import { Slider } from '@mui/material';

function MapSelector(props) {
    const [position, setPosition] = React.useState({lat: 33.1097, lng: -96.6608})
    const [radius, setRadius] = React.useState(props.radius || 100);

    function MapEvents() {
        const map = useMapEvents({
            click(e) {
            setPosition(e.latlng);
            map.flyTo(e.latlng, map.getZoom(), { animate: true });
            }
        })

        return null;
    }
      
    return (
        <div className="min-h-[400px] [&>*:first-child]:w-full [&>*:first-child]:h-full [&>*:first-child]:z-10 relative">
            <MapContainer center={{lat: 33.1097, lng: -96.6608}} zoom={13} scrollWheelZoom={true}>
                <TileLayer
                    attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                    url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                />
                <Circle
                    center={position}
                    radius={radius}
                    fillColor='blue'
                />
                <MapEvents />
            </MapContainer>
            <div className='absolute top-2 left-[10%] w-[90%] w-50 h-12 z-50 flex flex-row items-center max-md:flex-col'>
                <div className="bg-gray-100 p-2 rounded-xl flex-1 max-w-fit">
                    <input type="text" className='bg-transparent rounded-xl p-1 focus:outline-slate-300 w-[80%]' placeholder='Address' />
                    <button className="text-slate-700 rounded-xl font-semibold ml-2 hover:text-black">
                        <FontAwesomeIcon icon={faSearch} size="lg" className="mr-2" />
                    </button>
                </div>

                <Slider
                        className='mx-6 flex-1 max-md:max-w-[200px]'
                        defaultValue={radius}
                        getAriaValueText={(value) => value + 'm'}
                        valueLabelDisplay="auto"
                        onChange={(e, value) => setRadius(value)}
                        step={50}
                        min={50}
                        max={500}
                    />
            </div>
        </div>
    );
}

export default MapSelector;
import * as React from 'react';

import { Modal, FormControl,
    // InputLabel, MenuItem, Select,
    TextField, Button } from '@mui/material';

function ModifyUserModal(props) {
    // const [grade, setGrade] = React.useState([])
    // const [house, setHouse] = React.useState([]);
    const [points, setPoints] = React.useState(0);
    const [reason, setReason] = React.useState("Adjusted by an Administrator");

    const updateUser = () => {
        fetch(`${process.env.PUBLIC_URL}/admin/api/user/${props.user?.id}/modifyPoints`, {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                // grade: grade,
                // house: house,
                points: points,
                reason: reason
            })
        })
            .then(async (res) => {
                if (props.setOpen) props.setOpen(false);
                if (props.toast) {
                    const json = await res.json();

                    if (res.status === 200 && json.success) {
                        props.toast.success(json.msg, {
                            position: "top-right",
                            autoClose: 2000,
                            closeOnClick: true,
                            pauseOnHover: true,
                            theme: "light"
                        });
                        
                        if (props.onSuccess) {
                            props.onSuccess((val) => val + 1);
                        }
                    } else {
                        var errorText = res.statusText || json.reason || json.msg;
                        if (errorText.includes("Duplicate")) errorText = "Name already exists!";

                        props.toast.error(errorText, {
                            position: "top-right",
                            autoClose: 2000,
                            closeOnClick: true,
                            pauseOnHover: true,
                            theme: "light"
                        });
                    }
                }
            })
            .catch(e => console.error(e));
    }

    return (
        <Modal
            open={props.isOpen || false}
            onClose={() => {
                if (props.setOpen) props.setOpen(false)
            }}
        >
            <div className='absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 bg-white p-4 rounded min-w-[400px] max-w-full shadow'>
                <h2 className='text-2xl font-bold text-center'>Modify {props.user?.name}</h2>

                {/* <div className='p-2'></div>

                <FormControl fullWidth>
                    <InputLabel id="grade-label">Grade</InputLabel>
                    <Select
                        labelId="grade-label"
                        value={grade}
                        label="Grade"
                        onChange={(e) => setGrade(e.target.value)}
                    >
                        <MenuItem value={9}>Freshman</MenuItem>
                        <MenuItem value={10}>Sophomore</MenuItem>
                        <MenuItem value={11}>Junior</MenuItem>
                        <MenuItem value={12}>Senior</MenuItem>
                    </Select>
                </FormControl>

                <div className='p-2'></div>

                <FormControl fullWidth>
                    <InputLabel id="house-label">House</InputLabel>
                    <Select
                        labelId="house-label"
                        value={house}
                        label="House"
                        onChange={(e) => setHouse(e.target.value)}
                    >
                        <MenuItem value={100}>House 100</MenuItem>
                        <MenuItem value={200}>House 200</MenuItem>
                        <MenuItem value={300}>House 300</MenuItem>
                        <MenuItem value={400}>House 400</MenuItem>
                        <MenuItem value={500}>House 500</MenuItem>
                        <MenuItem value={600}>House 600</MenuItem>
                        <MenuItem value={700}>House 700</MenuItem>
                    </Select>
                </FormControl> */}

                <div className='p-2'></div>

                <FormControl fullWidth>
                    <TextField
                        variant='outlined'
                        labelId="points-label"
                        value={points}
                        label="Add Points"
                        type='number'
                        onChange={(e) => setPoints(parseInt(e.target.value))}
                    />
                </FormControl>

                <div className='p-2'></div>

                <FormControl fullWidth>
                    <TextField
                        variant='outlined'
                        labelId="reason-label"
                        value={reason}
                        label="Reason"
                        onChange={(e) => setReason(e.target.value)}
                    />
                </FormControl>

                <div className='p-2'></div>

                <div className='flex flex-row justify-center align-center gap-4'>
                    {/* Submit button */}
                    <Button
                        variant="contained"
                        color="success"
                        onClick={() => updateUser()}
                    >
                        Submit
                    </Button>

                    {/* Cancel button */}
                    <Button
                        variant="contained"
                        color="error"
                        component="a"
                        onClick={() => {
                            if (props.setOpen) props.setOpen(false)
                        }}
                    >
                        Cancel
                    </Button>
                </div>
            </div>
        </Modal>
    )
}

export default ModifyUserModal;

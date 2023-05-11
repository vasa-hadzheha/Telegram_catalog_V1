import React, { useState } from 'react';
import { Button, Container } from 'react-bootstrap';
import CreateBrand from '../components/modals/CreateBrand';
import CreateDevice from '../components/modals/CreateDevice';
import CreateType from '../components/modals/CreateType';
import DeleteDevice from '../components/modals/UpdateAndDeleteDevice';

const Admin =() => {
    const [brandVisible, setBrandVisible] = useState(false)
    const [typeVisible, setTypeVisible] = useState(false)
    const [deviceVisible, setDeviceVisible] = useState(false)
    const [deviceToDelete, setDeviceToDelete] = useState(null); // New state variable for device deletion

    const handleDeleteDevice = (deviceId) => {
        // Implement the logic to delete the device with the given ID
        // ...
    };
    const handleDelete = () => {
        console.log('Delete button clicked!');
        // code to handle deletion
      }

    return (
        <Container className='d-flex flex-column'>
            <Button 
                variant={"outline-primary"} 
                className="mt-4 p-2"
                onClick={()=> setTypeVisible(true)}
            > 
                Додати категорію
            </Button>

            <Button 
                variant={"outline-primary"} 
                className="mt-4 p-2"
                onClick={()=> setBrandVisible(true)}
            >
                Додати тип сортування
            </Button>

            <Button 
                variant={"outline-primary"} 
                className="mt-4 p-2"
                onClick={()=> setDeviceVisible(true)}
            > 
                Додати телеграм канал
            </Button>


             {/* Add button to open the delete device modal */}
             <Button 
                variant={"outline-danger"} 
                className="mt-4 p-2"
                onClick={() => setDeviceToDelete(true)}
            > 
                Delete Device
            </Button>

            {/* Pass the selected device, onDelete function, and onHide function to the delete device modal */}
            {deviceToDelete && (
                <DeleteDevice
                    show={true}
                    onHide={() => setDeviceToDelete(null)}
                    device={deviceToDelete}
                    onDelete={handleDeleteDevice}
                />
            )}

            <CreateBrand show={brandVisible} onHide={()=> setBrandVisible(false)}/>
            <CreateDevice show={deviceVisible} onHide={()=> setDeviceVisible(false)}/>
            <CreateType show = {typeVisible} onHide={()=> setTypeVisible(false)}/>
            
        </Container>
    );
};

export default Admin;
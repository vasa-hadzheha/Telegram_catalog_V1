import React, { useState } from 'react';
import { Modal, Button, Form } from 'react-bootstrap';
import { deleteDevice } from '../../http/deviceAPI';
import {useParams} from 'react-router-dom'
//some text
const DeleteDevice = ({ show, onHide }) => {
  const {id} = useParams()
  const [deviceId, setDeviceId] = useState('');

  const handleDelete = async () => {
    try {
      await deleteDevice(deviceId);
      onHide();
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <Modal show={show} onHide={onHide} centered>
      <Modal.Header closeButton>
        <Modal.Title>Ви впевнені що хочете видалити цей канал?</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          <Form.Group>
            <Form.Label>ID каналу</Form.Label>
            <Form.Control
              type='text'
              value={id}
              onChange={(e) => setDeviceId(e.target.value)}
              placeholder={`to delete channel input: ${id}`}
            />
          </Form.Group>
        </Form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant='secondary' onClick={onHide}>
          Закрити
        </Button>
        <Button variant='danger' onClick={handleDelete}>
          Видалити
        </Button>
      </Modal.Footer>
    </Modal>
  );
};

export default DeleteDevice;
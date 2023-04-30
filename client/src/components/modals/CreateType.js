import React, { useState } from 'react'
import {Form, Button} from 'react-bootstrap';
import Modal  from 'react-bootstrap/Modal';
import { createType } from '../../http/deviceAPI';

const CreateType = ({show, onHide}) => {

    const [value, setValue] = useState(' ')

    const addType = () => {

        createType({name: value}).then(data => {
        
            setValue(' ')
        
            onHide()
        })
    }

    return (
        <Modal
            show = {show}
            onHide = {onHide}
            size="lg"
            centered
            >
            <Modal.Header closeButton>
                <Modal.Title id="contained-modal-title-vcenter">
                Додати нову категорію
                </Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <Form.Control
                        value={value}
                        onChange={e => setValue(e.target.value)}
                        placeholder = {"Write name of the type"}
                    />
                </Form>
            </Modal.Body>
            <Modal.Footer>
                <Button variant='outline-primary' onClick={onHide}>Закрити</Button>
                <Button variant='outline-primary' onClick={addType}>Додати</Button>
            </Modal.Footer>
        </Modal>
    )
}

export default CreateType;
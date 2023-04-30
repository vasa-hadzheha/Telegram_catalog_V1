import React, { useEffect, useState } from 'react';
import { Col, Container, Image, Row } from 'react-bootstrap';
import {useParams} from 'react-router-dom'
import { fetchOneDevice } from '../http/deviceAPI';
const DevicePage =() => {
  const [device, setDevice] = useState({info:[]})
  const {id} = useParams()
    useEffect( () => {
        fetchOneDevice(id).then(data => setDevice(data)) 
    }, [])
  
    return (
    <Container className='mt-3'>
        <Row>
            <Col md={4}>
                <Image wigth={300} height={300} src={process.env.REACT_APP_API_URL + device.img}/>
            </Col>
        </Row>
        <Row className='d-flex flex-column m-3'>
            <h1>Опис каналу</h1>
            {device.info.map((info, index) =>
                <Row key={info.id} style={{background: index % 2 === 0 ? "lightgray" : 'transparent', padding: 10}}>
                    {info.title}: {info.description}
                </Row>    
            )}
        </Row>
    </Container>
    );
};

export default DevicePage;
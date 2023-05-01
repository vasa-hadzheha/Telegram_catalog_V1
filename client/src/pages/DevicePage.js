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

    const apiUrl = `http://localhost:7000/api/device/${id}`;
  
    const [channelName, setChannelName] = useState('');
    const [channelDescription, setChannelDescription] = useState('');
    const [channelImageLink, setChannelImageLink] = useState('');
    const [channelLink, setChannelLink] = useState('');
    const [channelSubscribers, setChannelSubscribers] = useState('');
    const [channelUsername, setChannelUsername] = useState('');
  
    const telegramApiKey = '6039392539:AAHJtUVAJGxMTiTIeitGNiB4nQfuYrTcy8w';
  
    useEffect(() => {
      fetch(apiUrl)
        .then(response => response.json())
        .then(data => {
          // Extract the description from the info array in the response data
          const descriptionObj = data.info.find(obj => obj.title === 'Посилання');
          const description = descriptionObj.description;
  
          // Extract the channel username from the description using a regular expression
          const match = description.match(/https?:\/\/t\.me\/(\w+)/);
          if (match && match[1]) {
            const linkDescription = `@${match[1]}`;
            setChannelUsername(linkDescription);
          } else {
            throw new Error('Unable to extract channel username from description');
          }
        })
        .catch(error => {
          console.error(error);
        });
    }, [apiUrl]);
  
    useEffect(() => {
      if (!channelUsername) return;
  
      fetch(`https://api.telegram.org/bot${telegramApiKey}/getChat?chat_id=${channelUsername}`)
        .then(response => response.json())
        .then(data => {
          setChannelName(data.result.title);
          setChannelDescription(data.result.description);
          const channelImageFileId = data.result.photo.big_file_id;
          setChannelLink(`https://t.me/${data.result.username}`);
  
          return fetch(`https://api.telegram.org/bot${telegramApiKey}/getFile?file_id=${channelImageFileId}`);
        })
        .then(response => response.json())
        .then(data => {
          setChannelImageLink(`https://api.telegram.org/file/bot${telegramApiKey}/${data.result.file_path}`);
        })
        .then(() => {
          return fetch(`https://api.telegram.org/bot${telegramApiKey}/getChatMembersCount?chat_id=${channelUsername}`);
        })
        .then(response => response.json())
        .then(data => {
          setChannelSubscribers(data.result);
        })
        .catch(error => {
          console.error(error);
        });
    }, [telegramApiKey, channelUsername]);
    console.log("channelUsername="+channelUsername)

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
            <div>
                <h1>-------------------------------------</h1>
      <h1>{channelName}</h1>
      <p>{channelDescription}</p>
      <img src={channelImageLink} alt="Channel Image" width="200" />
      <a href={channelLink} target="_blank" rel="noopener noreferrer">{channelLink}</a>
      <p>Subscribers: {channelSubscribers}</p>
    </div>
        </Row>
    </Container>
    );
};

export default DevicePage;
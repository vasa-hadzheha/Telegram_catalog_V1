import { Card, Col } from "react-bootstrap";
import React, { useEffect, useState } from 'react';
import Image from "react-bootstrap/Image";
import { useNavigate } from "react-router-dom";
import { DEVICE_ROUTE } from "../utils/consts";


const DeviceItem = ({device}) => {
    const history = useNavigate()

    const apiUrl = `http://localhost:7000/api/device/${device.id}`;
  
    const [channelName, setChannelName] = useState('');
    const [channelDescription, setChannelDescription] = useState('');
    const [channelImageLink, setChannelImageLink] = useState('');
    const [channelLink, setChannelLink] = useState('');
    const [channelSubscribers, setChannelSubscribers] = useState('');
    const [channelUsername, setChannelUsername] = useState('');

    const telegramApiKey = process.env.REACT_APP_TELEGRAM_KEY;

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
        <Col md={3} className="mt-4 d-flex" onClick={()=> history(DEVICE_ROUTE + '/' + device.id)}>
            <Card style={{width: 150, cursor:"pointer"}} border={"light"}>
                <Image width={150} heigh={150} src={channelImageLink}/>
                <div className="text-black-50 d-flex justify-content-between align-items-center">
                    <div> </div>

                </div>
                <div>{channelName}</div>
            </Card>
        </Col>
    );
};

export default DeviceItem;
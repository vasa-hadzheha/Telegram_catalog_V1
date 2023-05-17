import React, { useEffect, useState, useContext } from 'react';
import { Col, Container, Image, Row, Button } from 'react-bootstrap';
import { useParams } from 'react-router-dom';
import { fetchOneDevice } from '../http/deviceAPI';
import { Context } from '../index';
import DeleteDevice from '../components/modals/UpdateAndDeleteDevice';

const DevicePage = () => {
  const { user } = useContext(Context);
  const [deviceToDelete, setDeviceToDelete] = useState(null); // New state variable for device deletion

  const handleDeleteDevice = (deviceId) => {
    // Implement the logic to delete the device with the given ID
    // ...
  };
  // const handleDelete = () => {
  //   console.log('Delete button clicked!');
  //   // code to handle deletion
  // };

  const [device, setDevice] = useState({ info: [] });
  const { id } = useParams();
  useEffect(() => {
    fetchOneDevice(id).then((data) => setDevice(data));
  }, [id]);

  const apiUrl = `http://localhost:7000/api/device/${id}`;

  const [channelName, setChannelName] = useState('');
  const [channelDescription, setChannelDescription] = useState('');
  const [channelImageLink, setChannelImageLink] = useState('');
  const [channelLink, setChannelLink] = useState('');
  const [channelSubscribers, setChannelSubscribers] = useState('');
  const [channelUsername, setChannelUsername] = useState('');

  const telegramApiKey = process.env.REACT_APP_TELEGRAM_KEY;

  useEffect(() => {
    fetch(apiUrl)
      .then((response) => response.json())
      .then((data) => {
        // Extract the description from the info array in the response data
        const descriptionObj = data.info.find((obj) => obj.title === 'Посилання');
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
      .catch((error) => {
        console.error(error);
      });
  }, [apiUrl]);

  useEffect(() => {
    if (!channelUsername) return;

    fetch(`https://api.telegram.org/bot${telegramApiKey}/getChat?chat_id=${channelUsername}`)
      .then((response) => response.json())
      .then((data) => {
        setChannelName(data.result.title);
        setChannelDescription(data.result.description);
        const channelImageFileId = data.result.photo.big_file_id;
        setChannelLink(`https://t.me/${data.result.username}`);

        return fetch(`https://api.telegram.org/bot${telegramApiKey}/getFile?file_id=${channelImageFileId}`);
      })
      .then((response) => response.json())
      .then((data) => {
        setChannelImageLink(`https://api.telegram.org/file/bot${telegramApiKey}/${data.result.file_path}`);
      })
      .then(() => {
        return fetch(`https://api.telegram.org/bot${telegramApiKey}/getChatMembersCount?chat_id=${channelUsername}`);
      })
      .then((response) => response.json())
      .then((data) => {
        setChannelSubscribers(data.result);
      })
      .catch((error) => {
        console.error(error);
      });
  }, [telegramApiKey, channelUsername]);
  console.log('channelUsername=' + channelUsername);

  return (
    <Container className='mt-3'>
      <Row>
        <Col md={4}>
          <Image
            width={300}
            height={300}
            src={channelLink.startsWith('https://t.me/') ? channelImageLink : process.env.REACT_APP_API_URL + device.img}
            roundedCircle
          />
        </Col>
        <Col md={8} className='d-flex flex-column justify-content-center'>
          {channelLink.startsWith('https://t.me/') ? (
            <div className='channel-details'>
              <h3>{channelName}</h3>
              <p>{channelDescription}</p>
              <p>
                <strong>Link:</strong>{' '}
                <a href={channelLink} target='_blank' rel='noopener noreferrer'>
                  {channelLink}
                </a>
              </p>
              <p>
                <strong>Subscribers:</strong> {channelSubscribers}
              </p>
            </div>
          ) : (
            <div className='channel-details'>
            <h2>About the Channel</h2>
            {device.info.map((info, index) => (
              <Row
                key={info.id}
                style={{ background: index % 2 === 0 ? 'lightgray' : 'transparent', padding: 10 }}
              >
                <Col md={4}>
                  <strong>{info.title}:</strong>
                </Col>
                <Col md={8}>
                  {info.title === 'Посилання' && info.description.startsWith('https://t.me/') ? (
                    <a href={info.description} target='_blank' rel='noopener noreferrer'>
                      {info.description}
                    </a>
                  ) : (
                    info.description
                  )}
                </Col>
              </Row>
            ))}
          </div>

          )}
        </Col>
      </Row>
      {/* Add button to open the delete device modal */}
      {user.user.role === 'ADMIN' ? (
        <Button variant={'outline-danger'} className='mt-4 p-2' onClick={() => setDeviceToDelete(true)}>
          Delete Device
        </Button>
      ) : (
        <div></div>
      )}

      {/* Pass the selected device, onDelete function, and onHide function to the delete device modal */}
      {deviceToDelete && (
        <DeleteDevice
          show={true}
          onHide={() => setDeviceToDelete(null)}
          device={deviceToDelete}
          onDelete={handleDeleteDevice}
        />
      )}
    </Container>
  );
};

export default DevicePage;

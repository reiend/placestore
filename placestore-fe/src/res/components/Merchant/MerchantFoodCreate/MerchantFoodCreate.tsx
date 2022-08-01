import { useState } from 'react';
import axios from 'axios';
import { FormControl, Heading, Alert } from '@chakra-ui/react';

import FormFood from '../../Form/FormFood';
import blobToBase64 from '../../../../libs/reiend/js/blob';

interface FormFoodInputProps {
  name: string;
  category: string;
  description: string;
  price: string;
  picture: string;
}

const merchantFoodCreate = async (
  name: string,
  category: string,
  description: string,
  price: string,
  picture: string,
  storeID: number,
  authorization: string,
  url = `${import.meta.env.VITE_BASE_URL}food`
) => {
  if (authorization != '') {
    const response = await axios({
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `${JSON.parse(authorization).trim()}`
      },
      url: url,
      data: JSON.stringify({
        food: {
          name: name,
          category: category,
          description: description,
          price: price,
          store_id: storeID,
          picture: picture
        }
      })
    });
    return response;
  }
};

const MerchantFoodCreate = () => {
  const [requestErrorMessage, setRequestErrorMessage] = useState<string>('');
  const [validationMessages, setValidationMessages] = useState<string[]>([]);

  const onSubmit = async (
    { name, category, description, price }: FormFoodInputProps,
    e: {
      target: {
        reset: () => void;
        ['food-create-picture']: { files: unknown[] };
      };
    }
  ) => {
    const image = e.target['food-create-picture'].files[0];
    const imageBlob = window.URL.createObjectURL(image as Blob | MediaSource);

    const authorization = localStorage.getItem('authorization') || '';
    const storeID = localStorage.getItem('storeID') || 1;

    blobToBase64(imageBlob).then(async (base64String: string) => {
      await merchantFoodCreate(
        name,
        category,
        description,
        price,
        base64String, // i.e: data:image/jpeg;base64,/9j/4AAQSkZJ..
        storeID as number,
        authorization
      )
        .then(res => {
          if (res != null && res.data.status.code === 422) {
            const messages = res.data.status.error
              .split('Validation failed:')[1]
              .split(',');
            setValidationMessages(messages);
          } else {
            setRequestErrorMessage('');
            setValidationMessages([]);
            // Reset Form
            e.target.reset();
          }
        })
        .catch(error => {
          if (error.response.status === 401) {
            setRequestErrorMessage('signup as a merchant to continue');
          } else {
            setRequestErrorMessage(
              error.response.data.status.message.split('.')[1]
            );
          }
        });
    });
  };

  return (
    <FormControl w={'100%'} maxW={'500px'} p={'1rem'} mx={'auto'}>
      <Heading mb={'20px'} fontSize={'clamp(1rem, 1rem + 0.5vw, 3rem)'}>
        Create a Food
      </Heading>

      {validationMessages.length !== 0 && (
        <Alert
          data-testid={'requestErrorMessage'}
          status='error'
          mb={'10px'}
          borderRadius={'var(--chakra-radii-md)'}
          color={'red.900'}
          flexDir='column'
          alignItems={'flex-start'}
        >
          {validationMessages.map((message: string, i) => (
            <div key={i}>{message}</div>
          ))}
        </Alert>
      )}

      {requestErrorMessage && (
        <Alert
          data-testID={'requestErrorMessage'}
          status='error'
          mb={'10px'}
          borderRadius={'var(--chakra-radii-md)'}
          color={'red.900'}
        >
          {requestErrorMessage}
        </Alert>
      )}

      <FormFood onSubmit={onSubmit} buttonText={'create'} />
    </FormControl>
  );
};

export default MerchantFoodCreate;
export { merchantFoodCreate };

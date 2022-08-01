import { useState } from 'react';
import axios from 'axios';
import { Alert, FormControl, Heading } from '@chakra-ui/react';
import FormStore from '../../Form/FormStore';

interface StoreCreateFormProps {
  name: string;
  line1: string;
  line2: string;
  postalCode: string;
  city: string;
  province: string;
}

const storeCreate = async (
  name: string,
  line1: string,
  line2: string,
  postalCode: string,
  city: string,
  province: string,
  authorization: string,
  url = `${import.meta.env.VITE_BASE_URL}store`
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
        store: {
          name: name,
          line1: line1,
          line2: line2,
          postal_code: postalCode,
          city: city,
          province: province
        }
      })
    });
    return response;
  }
};

const StoreCreate = () => {
  const [requestErrorMessage, setRequestErrorMessage] = useState<string>('');
  const [validationMessages, setValidationMessages] = useState<string[]>([]);

  const onSubmit = async (
    { name, line1, line2, postalCode, city, province }: StoreCreateFormProps,
    e: { target: { reset: () => void } }
  ) => {
    const authorization = localStorage.getItem('authorization') || '';
    await storeCreate(
      name,
      line1,
      line2,
      postalCode,
      city,
      province,
      authorization
    )
      .then(res => {
        if (res != null && res.data.status.code === 422) {
          const messages = res.data.status.errors
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
          setRequestErrorMessage('signin as a merchant to continue');
        } else {
          setRequestErrorMessage(
            error.response.data.status.message.split('.')[1]
          );
        }
      });
  };

  return (
    <FormControl w={'100%'} maxW={'500px'} p={'1rem'}>
      <Heading mb={'20px'} fontSize={'clamp(1rem, 1rem + 0.5vw, 3rem)'}>
        Create a Store
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
          data-testid={'requestErrorMessage'}
          status='error'
          mb={'10px'}
          borderRadius={'var(--chakra-radii-md)'}
          color={'red.900'}
        >
          {requestErrorMessage}
        </Alert>
      )}
      <FormStore onSubmit={onSubmit} buttonText='create' />
    </FormControl>
  );
};

export default StoreCreate;
export { storeCreate };

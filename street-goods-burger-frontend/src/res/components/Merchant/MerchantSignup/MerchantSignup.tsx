import { useState } from 'react';
import axios from 'axios';
import { FormControl, Heading, Alert } from '@chakra-ui/react';

import Signup from '../../Form/Signup';

interface MerchantSignupProps {
  email: string;
  password: string;
  passwordConfirmation: string;
}

const merchantSignup = async (
  email: string,
  password: string,
  passwordConfirmation: string,
  url = `${process.env.BASE_URL}store_admin/signup`
) => {
  const response = await axios({
    method: 'post',
    headers: { 'Content-Type': 'application/json' },
    url: url,
    data: JSON.stringify({
      store_admin: {
        email: email,
        password: password,
        password_confirmation: passwordConfirmation
      }
    })
  });
  return response;
};

const MerchantSignup = () => {
  const [requestErrorMessage, setRequestErrorMessage] = useState<string>('');

  const onSubmit = async (
    { email, password, passwordConfirmation }: MerchantSignupProps,
    e: { target: { reset: () => void } }
  ) => {
    await merchantSignup(email, password, passwordConfirmation)
      .then(res => {
        setRequestErrorMessage('');
        console.log(res);
        const { data, headers } = res;

        const merchantID = data.data.id;
        const merchantEmail = data.data.email;
        const role = data.data.email;
        const authorization = headers.authorization;

        // store merchant info
        localStorage.setItem('merchantID', merchantID);
        localStorage.setItem('merchantEmail', merchantEmail);
        localStorage.setItem('authorization', authorization);
        localStorage.setItem('role', role);

        // reset form
        e.target.reset();
      })
      .catch(error => {
        setRequestErrorMessage(
          error.response.data.status.message.split('.')[1]
        );
      });
  };

  return (
    <FormControl w={'100%'} maxW={'500px'} p={'1rem'}>
      <Heading mb={'20px'} fontSize={'clamp(1rem, 1rem + 0.5vw, 3rem)'}>
        Signup as Merchant
      </Heading>

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
      <Signup onSubmit={onSubmit} />
    </FormControl>
  );
};

export default MerchantSignup;
export { merchantSignup };

import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';
import { FormControl, Alert, Heading, Text } from '@chakra-ui/react';

import Signin from '../../Form/Signin';

interface MerchantSigninProps {
  email: string;
  password: string;
}

const merchantSignin = async (
  email: string,
  password: string,
  url = `${import.meta.env.VITE_BASE_URL}store_admin/signin`
) => {
  const response = await axios({
    method: 'post',
    headers: { 'Content-Type': 'application/json' },
    url: url,
    data: JSON.stringify({
      store_admin: {
        email: email,
        password: password
      }
    })
  });
  return response;
};

const MerchantSignin = () => {
  const [requestErrorMessage, setRequestErrorMessage] = useState<string>('');
  const navigate = useNavigate();

  const onSubmit = async (
    { email, password }: MerchantSigninProps,
    e: { target: { reset: () => void } }
  ) => {
    await merchantSignin(email, password)
      .then(res => {
        setRequestErrorMessage('');
        const { data, headers } = res;

        const merchantID = data.data.id;
        const merchantEmail = data.data.email;
        const authorization = headers.authorization;
        const role = data.data.role;

        // store merchant info
        localStorage.setItem('merchantID', merchantID);
        localStorage.setItem('merchantEmail', merchantEmail);
        localStorage.setItem('authorization', JSON.stringify(authorization));
        localStorage.setItem('role', role);

        // reset form
        e.target.reset();

        navigate('/merchant/dashboard', { replace: true });
      })
      .catch(error => {
        // show invalid email or password
        setRequestErrorMessage(error.response.data);
      });
  };

  return (
    <FormControl w={'100%'} maxW={'500px'} p={'1rem'} mx={'auto'}>
      <Heading
        mb={'20px'}
        fontSize={'clamp(1rem, 1rem + 0.5vw, 3rem)'}
        color={'teal'}
      >
        Place your Store now
      </Heading>
      <Heading mb={'20px'} fontSize={'clamp(0.8rem, 0.8rem + 0.5vw, 3rem)'}>
        Signin as Merchant
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
      <Signin onSubmit={onSubmit} />
      <Text _hover={{ color: 'teal' }} mt={'2rem'}>
        <Link to={'/merchant/signup'}>no account?</Link>
      </Text>
    </FormControl>
  );
};

export default MerchantSignin;
export { merchantSignin };

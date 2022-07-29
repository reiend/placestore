import { useForm } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { object, string } from 'yup';

import { CgProfile, CgPassword } from 'react-icons/cg';
import { chakra, Icon, Flex, Button, Input, Alert } from '@chakra-ui/react';

const SigninSchema = object({
  email: string().required('please provide an email'),
  password: string().required('please provide a password')
});

interface SigninFormProps {
  email: string;
  password: string;
}

interface SigninProps {
  onSubmit: (submitProps: SigninFormProps, event: any) => void;
  buttonText?: 'signin' | 'login';
}

const Signin = ({ onSubmit, buttonText = 'signin' }: SigninProps) => {
  const {
    register,
    handleSubmit,
    formState: { errors }
  } = useForm<SigninFormProps>({
    resolver: yupResolver(SigninSchema)
  });

  return (
    <chakra.form onSubmit={handleSubmit(onSubmit)} data-testid={'signin'}>
      <Flex align={'center'} fontSize={'2rem'} mb={'10px'}>
        <Icon as={CgProfile} color='teal' mr={'10px'} />{' '}
        <Input
          {...register('email')}
          id={'email'}
          type='email'
          placeholder={'email'}
          autoComplete='on'
          _focusVisible={{ borderColor: 'teal' }}
        />
      </Flex>

      {errors.email?.message && (
        <Alert
          status='error'
          mb={'10px'}
          borderRadius={'var(--chakra-radii-md)'}
          color={'red.900'}
        >
          {errors.email?.message}
        </Alert>
      )}

      <Flex align={'center'} fontSize={'2rem'} mb={'10px'}>
        <Icon as={CgPassword} color='teal' mr={'10px'} />
        <Input
          {...register('password')}
          id={'password'}
          type='password'
          placeholder={'password'}
          autoComplete='on'
          _focusVisible={{ borderColor: 'teal' }}
        />
      </Flex>
      {errors.password?.message && (
        <Alert
          status='error'
          mb={'10px'}
          borderRadius={'var(--chakra-radii-md)'}
          color={'red.900'}
        >
          {errors.password?.message}
        </Alert>
      )}

      <Button colorScheme='teal' type={'submit'} float={'right'}>
        {buttonText}
      </Button>
    </chakra.form>
  );
};

export default Signin;

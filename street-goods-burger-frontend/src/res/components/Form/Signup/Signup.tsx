import { useForm } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { object, string, ref } from 'yup';

import { CgProfile, CgPassword } from 'react-icons/cg';
import { chakra, Icon, Flex, Button, Input, Alert } from '@chakra-ui/react';

const SignupSchema = object({
  email: string().required('please provide an email'),
  password: string().min(6).required('please provide a password'),
  passwordConfirmation: string()
    .required('please provide a password confirmation')
    .oneOf([ref('password')], 'Passwords must match')
});

interface SignupFormProps {
  email: string;
  password: string;
  passwordConfirmation: string;
}

interface SigninProps {
  onSubmit: (submitProps: SignupFormProps, event: any) => void;
  buttonText?: 'signup' | 'register';
}

const Signup = ({ onSubmit, buttonText = 'signup' }: SigninProps) => {
  const {
    register,
    handleSubmit,
    formState: { errors }
  } = useForm<SignupFormProps>({
    resolver: yupResolver(SignupSchema)
  });

  return (
    <chakra.form onSubmit={handleSubmit(onSubmit)} data-testid={'signup'}>
      <Flex align={'center'} fontSize={'2rem'} mb={'10px'}>
        <Icon as={CgProfile} color='teal' mr={'10px'} />{' '}
        <Input
          {...register('email')}
          id={'signupEmail'}
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
          id={'signupPassword'}
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

      <Flex align={'center'} fontSize={'2rem'} mb={'10px'}>
        <Icon as={CgPassword} color='teal' mr={'10px'} />
        <Input
          {...register('passwordConfirmation')}
          id={'signupPasswordConfirmation'}
          type='password'
          placeholder={'password confirmation'}
          autoComplete='on'
          _focusVisible={{ borderColor: 'teal' }}
        />
      </Flex>

      {errors.passwordConfirmation?.message && (
        <Alert
          status='error'
          mb={'10px'}
          borderRadius={'var(--chakra-radii-md)'}
          color={'red.900'}
        >
          {errors.passwordConfirmation?.message}
        </Alert>
      )}

      <Button colorScheme='teal' type={'submit'} float={'right'}>
        {buttonText}
      </Button>
    </chakra.form>
  );
};

export default Signup;

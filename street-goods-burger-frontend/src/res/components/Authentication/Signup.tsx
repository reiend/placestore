import { useForm } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import SigninSchema from '@schemas/Signup';

interface SigninInputs {
  firstname: string;
  lastname: string;
  email: string;
  password: string;
  passwordConfirmation: string;
}

const Signup = () => {
  const {
    register,
    handleSubmit,
    formState: { errors }
  } = useForm<SigninInputs>({
    resolver: yupResolver(SigninSchema)
  });
  const onSubmit = (data: SigninInputs) => {
    console.log(data);
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)} className='form'>
      <div className='form__inputs'>
        <input {...register('firstname')} placeholder='firstname' />
        <input {...register('lastname')} placeholder='lastname' />
        <input {...register('email')} placeholder='e.g. email@gmail.com' />
        <input {...register('password')} placeholder='password' />
        <input
          {...register('passwordConfirmation')}
          placeholder='password confirmation'
        />
      </div>

      <div className='form__errors'>
        <p>{errors.firstname?.message}</p>
        <p>{errors.lastname?.message}</p>
        <p>{errors.email?.message}</p>
        <p>{errors.password?.message}</p>
        <p>{errors.passwordConfirmation?.message}</p>
      </div>

      <input type='submit' value='Signup' />
    </form>
  );
};

export default Signup;

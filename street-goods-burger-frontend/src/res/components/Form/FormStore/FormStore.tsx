import { useForm } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { object, string } from 'yup';

import { MdOutlineFoodBank } from 'react-icons/md';
import { ImAddressBook } from 'react-icons/im';
import { chakra, Icon, Flex, Button, Input, Alert } from '@chakra-ui/react';

const FormStoreSchema = object({
  name: string().max(128).required('please provide a name'),
  line1: string().max(128).required('please provide a line1'),
  line2: string().max(128).required('please provide a line2'),
  postalCode: string().max(128).required('please provide a postal code'),
  city: string().max(128).required('please provide a city'),
  province: string().max(128).required('please provide a province')
});

interface FormStoreInputProps {
  name: string;
  line1: string;
  line2: string;
  postalCode: string;
  city: string;
  province: string;
}

interface FormStoreProps {
  onSubmit: (submitProps: FormStoreInputProps, event: any) => void;
  buttonText?: 'edit' | 'create' | 'delete';
}

const FormStore = ({ onSubmit, buttonText = 'create' }: FormStoreProps) => {
  const {
    register,
    handleSubmit,
    formState: { errors }
  } = useForm<FormStoreInputProps>({
    resolver: yupResolver(FormStoreSchema)
  });

  return (
    <chakra.form onSubmit={handleSubmit(onSubmit)} data-testid={'form-store'}>
      <Flex align={'flex-start'} fontSize={'2rem'} mb={'10px'} w={'100%'}>
        <Icon as={MdOutlineFoodBank} color='teal' mr={'10px'} />{' '}
        <Flex wrap={'wrap'} w={'100%'}>
          <Input
            {...register('name')}
            id={'store-create-name'}
            type='text'
            placeholder={'name'}
            autoComplete='on'
            mb={'10px'}
            _focusVisible={{ borderColor: 'teal' }}
          />
          {errors.name?.message && (
            <Alert
              status='error'
              mb={'10px'}
              borderRadius={'var(--chakra-radii-md)'}
              fontSize={'1rem'}
              color={'red.900'}
            >
              {errors.name?.message}
            </Alert>
          )}
        </Flex>
      </Flex>

      <Flex align={'flex-start'} fontSize={'2rem'} mb={'10px'}>
        <Icon as={ImAddressBook} color='teal' mr={'10px'} />{' '}
        <Flex wrap={'wrap'}>
          <Input
            {...register('line1')}
            id={'store-create-line1'}
            type='text'
            placeholder={'line 1'}
            autoComplete='on'
            _focusVisible={{ borderColor: 'teal' }}
            mb={'10px'}
          />

          {errors.line1?.message && (
            <Alert
              status='error'
              mb={'10px'}
              borderRadius={'var(--chakra-radii-md)'}
              color={'red.900'}
              fontSize={'1rem'}
            >
              {errors.line1?.message}
            </Alert>
          )}
          <Input
            {...register('line2')}
            id={'store-create-line2'}
            type='text'
            placeholder={'line 2'}
            autoComplete='on'
            _focusVisible={{ borderColor: 'teal' }}
            mb={'10px'}
          />

          {errors.line2?.message && (
            <Alert
              status='error'
              mb={'10px'}
              borderRadius={'var(--chakra-radii-md)'}
              fontSize={'1rem'}
              color={'red.900'}
            >
              {errors.line2?.message}
            </Alert>
          )}

          <Input
            {...register('postalCode')}
            id={'store-create-postal-code'}
            type='text'
            placeholder={'postal code'}
            autoComplete='on'
            _focusVisible={{ borderColor: 'teal' }}
            mb={'10px'}
          />

          {errors.postalCode?.message && (
            <Alert
              status='error'
              mb={'10px'}
              borderRadius={'var(--chakra-radii-md)'}
              color={'red.900'}
              fontSize={'1rem'}
            >
              {errors.postalCode?.message}
            </Alert>
          )}

          <Input
            {...register('city')}
            id={'store-create-city'}
            type='text'
            placeholder={'city'}
            autoComplete='on'
            _focusVisible={{ borderColor: 'teal' }}
            mb={'10px'}
          />

          {errors.city?.message && (
            <Alert
              status='error'
              mb={'10px'}
              borderRadius={'var(--chakra-radii-md)'}
              color={'red.900'}
              fontSize={'1rem'}
            >
              {errors.city?.message}
            </Alert>
          )}
          <Input
            {...register('province')}
            id={'store-create-province'}
            type='text'
            placeholder={'province'}
            autoComplete='on'
            _focusVisible={{ borderColor: 'teal' }}
            mb={'10px'}
          />
          {errors.province?.message && (
            <Alert
              status='error'
              mb={'10px'}
              borderRadius={'var(--chakra-radii-md)'}
              color={'red.900'}
              fontSize={'1rem'}
            >
              {errors.province?.message}
            </Alert>
          )}
        </Flex>
      </Flex>

      <Button type={'submit'} colorScheme={'teal'} float={'right'}>
        {buttonText}
      </Button>
    </chakra.form>
  );
};

export default FormStore;

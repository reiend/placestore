import { useForm } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { object, string, number } from 'yup';
import {
  chakra,
  Icon,
  Flex,
  Button,
  Input,
  Alert,
  Textarea,
  FormLabel,
  Select
} from '@chakra-ui/react';
import {
  MdOutlineFoodBank,
  MdOutlineCategory,
  MdDescription
} from 'react-icons/md';
import { AiFillPicture } from 'react-icons/ai';
import { ImPriceTag } from 'react-icons/im';

import unique from '../../../../libs/reiend/js/unique';

interface StoreProps {
  id: string;
  name: string;
  line1: string;
  line2: string;
  postalCode: string;
  city: string;
  province: string;
}

const FormFoodSchema = object({
  name: string().max(128).required('please provide a name'),
  category: string().max(128).required('please provide a category'),
  description: string().max(128).required('please provide a description'),
  price: number()
    .required('please provide a price')
    .typeError('please provide a valid price'),
  picture: string().required('please provide a picture'),
  store_id: string().required('please provice a store')
});

interface FormFoodInputProps {
  name: string;
  category: string;
  description: string;
  price: string;
  picture: string;
  store_id: string;
}

interface FormStoreProps {
  onSubmit: (submitProps: FormFoodInputProps, event: any) => void;
  buttonText?: 'edit' | 'create' | 'delete';
  storeList;
}

const FormStore = ({
  onSubmit,
  buttonText = 'create',
  storeList
}: FormStoreProps) => {
  const {
    register,
    handleSubmit,
    formState: { errors }
  } = useForm<FormFoodInputProps>({
    resolver: yupResolver(FormFoodSchema)
  });

  const getUniqueKey = (letters: number, numbers: number) => {
    return unique({ letters, numbers });
  };

  return (
    <chakra.form onSubmit={handleSubmit(onSubmit)} data-testid={'form-food'}>
      <Flex align={'flex-start'} fontSize={'2rem'} mb={'10px'}>
        <Icon as={MdOutlineFoodBank} color='teal' mr={'10px'} />
        <Input
          {...register('name')}
          id={'food-create-name'}
          type='text'
          placeholder={'name'}
          autoComplete='on'
          mb={'10px'}
          _focusVisible={{ borderColor: 'teal' }}
        />
      </Flex>
      {errors.name?.message && (
        <Alert
          status='error'
          mb={'10px'}
          borderRadius={'var(--chakra-radii-md)'}
          color={'red.900'}
        >
          {errors.name?.message}
        </Alert>
      )}

      <Flex align={'flex-start'} fontSize={'2rem'} mb={'10px'}>
        <Icon as={MdOutlineCategory} color='teal' mr={'10px'} />
        <Input
          {...register('category')}
          id={'food-create-category'}
          type='text'
          placeholder={'category'}
          autoComplete='on'
          mb={'10px'}
          _focusVisible={{ borderColor: 'teal' }}
        />
      </Flex>
      {errors.category?.message && (
        <Alert
          status='error'
          mb={'10px'}
          borderRadius={'var(--chakra-radii-md)'}
          color={'red.900'}
        >
          {errors.category?.message}
        </Alert>
      )}

      <Flex align={'flex-start'} fontSize={'2rem'} mb={'10px'}>
        <Icon as={ImPriceTag} color='teal' mr={'10px'} />
        <Input
          {...register('price')}
          id={'food-create-price'}
          type='text'
          placeholder={'price in PHP'}
          autoComplete='on'
          mb={'10px'}
          _focusVisible={{ borderColor: 'teal' }}
        />
      </Flex>
      {errors.price?.message && (
        <Alert
          status='error'
          mb={'10px'}
          borderRadius={'var(--chakra-radii-md)'}
          color={'red.900'}
        >
          {errors.price?.message}
        </Alert>
      )}

      <Flex align={'flex-start'} fontSize={'2rem'} mb={'10px'}>
        <Icon as={MdDescription} color='teal' mr={'10px'} />

        <Select
          {...register('store_id')}
          id={'food-create-store-id'}
          placeholder={'select store'}
          mb={'10px'}
          _focusVisible={{ borderColor: 'teal' }}
        >
          {storeList.map((store: StoreProps) => (
            <option key={`${getUniqueKey(5, 5)}`}>{store.name}</option>
          ))}
        </Select>
      </Flex>

      {errors.store_id?.message && (
        <Alert
          status='error'
          mb={'10px'}
          borderRadius={'var(--chakra-radii-md)'}
          color={'red.900'}
        >
          {errors.store_id?.message}
        </Alert>
      )}

      <Flex align={'flex-start'} fontSize={'2rem'} mb={'10px'}>
        <Icon as={MdDescription} color='teal' mr={'10px'} />
        <Textarea
          {...register('description')}
          id={'food-create-description'}
          placeholder={'description'}
          autoComplete='on'
          mb={'10px'}
          _focusVisible={{ borderColor: 'teal' }}
        />
      </Flex>
      {errors.description?.message && (
        <Alert
          status='error'
          mb={'10px'}
          borderRadius={'var(--chakra-radii-md)'}
          color={'red.900'}
        >
          {errors.description?.message}
        </Alert>
      )}

      <Flex align={'flex-start'} fontSize={'2rem'} mb={'10px'} float={'left'}>
        <Input
          {...register('picture')}
          id={'food-create-picture'}
          name={'food-create-picture'}
          type='file'
          placeholder={'picture'}
          autoComplete='on'
          hidden={true}
          mb={'10px'}
          _focusVisible={{ borderColor: 'teal' }}
        />

        <FormLabel
          htmlFor={'food-create-picture'}
          display={'flex'}
          backgroundColor={'teal.50'}
          padding={'0.5rem'}
          borderRadius={'var(--chakra-radii-md)'}
          cursor={'pointer'}
          _hover={{ filter: 'contrast(0.90)' }}
          transition={'200ms ease-in'}
        >
          <Icon as={AiFillPicture} color='teal' fontSize={'2rem'} mr={'10px'} />
          Choose file
        </FormLabel>
      </Flex>
      {errors.picture?.message && (
        <Alert
          status='error'
          mb={'10px'}
          borderRadius={'var(--chakra-radii-md)'}
          color={'red.900'}
        >
          {errors.picture?.message}
        </Alert>
      )}

      <Button type={'submit'} colorScheme={'teal'} float={'right'}>
        {buttonText}
      </Button>
    </chakra.form>
  );
};

export default FormStore;

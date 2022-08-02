import { useState, useEffect } from 'react';
import axios from 'axios';
import {
  Box,
  Heading,
  Text,
  Flex,
  Skeleton,
  SkeletonText,
  Image
} from '@chakra-ui/react';
import { MdOutlineFoodBank } from 'react-icons/md';
import FoodImageDefault from '../../../../assets/FoodImageDefault.png';

import unique from '../../../../libs/reiend/js/unique';

interface FoodProps {
  id: string;
  name: string;
  description: string;
  category: string;
  picture: string;
  price: string;
}

const StoreFoods = () => {
  const [foodList, setFoodList] = useState([]);
  const [isLoad, setIsLoad] = useState<boolean>(false);
  const [storeName, setStoreName] = useState<string>('noName');

  const getUniqueKey = (letters: number, numbers: number) => {
    return unique({ letters, numbers });
  };

  const skeletons = (number: number) => {
    const skeletonContainer: JSX.Element[] = [];

    for (let i = 0; i < number; i++) {
      skeletonContainer.push(
        <Box mb={'20px'} key={getUniqueKey(5, 5)}>
          <Skeleton isLoaded={isLoad}>
            <Image
              src={FoodImageDefault}
              alt={'no image'}
              objectFit={'cover'}
              maxH={'200px'}
              w={'350px'}
              mb={'10px'}
              loading={'lazy'}
            />
          </Skeleton>
          <SkeletonText mt='4' noOfLines={5} spacing='4' />
        </Box>
      );
    }

    return skeletonContainer;
  };

  useEffect(() => {
    const storeID = JSON.parse(localStorage.getItem('storeID'));
    setTimeout(async () => {
      await axios({
        method: 'get',
        headers: {
          'Content-Type': 'application/json'
        },
        url: `${import.meta.env.VITE_BASE_URL}store/?id=${storeID}`
      })
        .then(res => {
          setIsLoad(true);
          setStoreName(res.data.data.store.name);
          !(res.data.data.foods.length === 0) &&
            setFoodList(res.data.data.foods);
        })
        .catch(() => {
          return <div>something went wrong</div>;
        });
    }, 1500);
  }, []);

  return (
    <Box maxW={'1200px'} mx={'auto'}>
      <Skeleton isLoaded={isLoad}>
        <Flex
          align={'center'}
          color={'teal'}
          borderBottom={'2px solid teal'}
          mb={'20px'}
        >
          <MdOutlineFoodBank fontSize={'5rem'} />
          <Heading color={'teal'} ml={'10px'}>
            {storeName}&apos;s foods
          </Heading>
        </Flex>
      </Skeleton>
      {!isLoad ? (
        <Flex wrap={'wrap'} gap={'50px'} justify={'center'}>
          {skeletons(9)}
        </Flex>
      ) : foodList.length !== 0 ? (
        <Flex wrap={'wrap'} gap={'50px'} justify={'center'}>
          {foodList.map((food: FoodProps) => (
            <Box
              key={`${getUniqueKey(5, 5)}`}
              id={food.id}
              borderRadius={'var(--chakra-radii-md)'}
              overflow={'hidden'}
              mb={'20px'}
              cursor={'pointer'}
              _hover={{
                boxShadow: 'xl'
              }}
              transition={'200ms ease-in'}
              padding={'1rem'}
            >
              <Image
                src={`${food.picture || FoodImageDefault}`}
                alt={food.name}
                objectFit={'contain'}
                mb={'10px'}
                maxH={'200px'}
                loading={'lazy'}
                w={'300px'}
              />

              <Heading
                fontSize={'clamp(1rem, 0.2rem + 0.5vw, 2rem)'}
                textTransform={'capitalize'}
                mb={'0'}
              >
                {food.name}
              </Heading>
              <Text
                display={'inline'}
                textTransform={'capitalize'}
                fontStyle={'italic'}
                fontSize={'clamp(0.8rem, 0.2rem + 0.5vw, 1.5rem)'}
              >
                {food.category},{' '}
              </Text>
              <Text
                display={'inline'}
                textTransform={'capitalize'}
                fontStyle={'italic'}
                fontSize={'clamp(0.8rem, 0.2rem + 0.5vw, 1.5rem)'}
              >
                {food.price} PHP
              </Text>

              <Text
                mt={'2rem'}
                display={'block'}
                textTransform={'capitalize'}
                fontSize={'clamp(0.8rem, 0.2rem + 0.5vw, 1.5rem)'}
              >
                {food.description}
              </Text>
            </Box>
          ))}
        </Flex>
      ) : (
        <Skeleton isLoaded={isLoad}>
          <Heading textAlign={'center'}>
            {storeName} doesn&apos;t have any food yet
          </Heading>
        </Skeleton>
      )}
    </Box>
  );
};

export default StoreFoods;

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
import { RiStore3Fill } from 'react-icons/ri';

import unique from '../../../../libs/reiend/js/unique';
import ImageDefault from '../../../../assets/ImageDefault.jpg';

interface StoreProps {
  id: string;
  name: string;
  line1: string;
  line2: string;
  postalCode: string;
  city: string;
  province: string;
}

const StoreList = () => {
  const [storeList, setStoreList] = useState([]);
  const [isLoad, setIsLoad] = useState(false);

  useEffect(() => {
    setTimeout(async () => {
      await axios({
        method: 'get',
        headers: {
          'Content-Type': 'application/json'
        },
        url: `${import.meta.env.VITE_BASE_URL}store/list`
      })
        .then(res => {
          setIsLoad(true);
          setStoreList(res.data.data);
        })
        .catch(() => {
          return <div>something went wrong</div>;
        });
    }, 1500);
  }, []);

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
              src={ImageDefault}
              alt={'no image'}
              w={'100%'}
              maxW={'350px'}
              objectFit={'cover'}
              maxH={'200px'}
              mb={'10px'}
            />
          </Skeleton>
          <SkeletonText mt='4' noOfLines={5} spacing='4' />
        </Box>
      );
    }

    return skeletonContainer;
  };

  return (
    <Box maxW={'1200px'} mx={'auto'}>
      <Flex
        align={'center'}
        color={'teal'}
        borderBottom={'2px solid teal'}
        mb={'20px'}
      >
        <RiStore3Fill fontSize={'5rem'} />
        <Heading color={'teal'} ml={'10px'}>
          Stores
        </Heading>
      </Flex>
      {!isLoad ? (
        <Flex wrap={'wrap'} gap={'50px'} justify={'center'}>
          {skeletons(9)}
        </Flex>
      ) : (
        <Flex wrap={'wrap'} gap={'50px'} justify={'center'}>
          {storeList.map((store: StoreProps) => (
            <Box
              key={`${getUniqueKey(5, 5)}`}
              id={store.id}
              borderRadius={'var(--chakra-radii-md)'}
              overflow={'hidden'}
              mb={'20px'}
              cursor={'pointer'}
              _hover={{
                filter:
                  'invert(37%) sepia(67%) saturate(371%) hue-rotate(132deg) brightness(96%) contrast(92%)'
              }}
              transition={'200ms ease-in'}
            >
              <Image
                src={ImageDefault}
                alt={'no image'}
                w={'100%'}
                maxW={'350px'}
                objectFit={'cover'}
                maxH={'200px'}
                mb={'10px'}
              />

              <Heading
                fontSize={'clamp(1rem, 0.2rem + 0.5vw, 2rem)'}
                textTransform={'capitalize'}
                mb={'0'}
              >
                {store.name}
              </Heading>
              <Text
                display={'inline'}
                textTransform={'capitalize'}
                fontStyle={'italic'}
                fontSize={'clamp(0.8rem, 0.2rem + 0.5vw, 1.2rem)'}
              >
                {store.city},{' '}
              </Text>
              <Text
                display={'inline'}
                textTransform={'capitalize'}
                fontStyle={'italic'}
                fontSize={'clamp(0.8rem, 0.2rem + 0.5vw, 1.2rem)'}
              >
                {store.province}
              </Text>
            </Box>
          ))}
        </Flex>
      )}
    </Box>
  );
};

export default StoreList;

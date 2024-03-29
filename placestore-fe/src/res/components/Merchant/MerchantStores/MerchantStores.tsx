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

const MerchantStores = () => {
  const [storeList, setStoreList] = useState([]);
  const [isLoad, setIsLoad] = useState(false);

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
    setTimeout(async () => {
      await axios({
        method: 'get',
        headers: {
          'Content-Type': 'application/json',
          Authorization: JSON.parse(localStorage.getItem('authorization'))
        },
        url: `${import.meta.env.VITE_BASE_URL}store_admin/stores`
      })
        .then(res => {
          setIsLoad(true);
          setStoreList(res.data);
        })
        .catch(() => {
          return <div>something went wrong</div>;
        });
    }, 1500);
  }, []);

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
          Merchant Stores
        </Heading>
      </Flex>
      {!isLoad ? (
        <Flex wrap={'wrap'} gap={'50px'} justify={'center'}>
          {skeletons(9)}
        </Flex>
      ) : storeList.length !== 0 ? (
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
                boxShadow: 'xl'
              }}
              transition={'200ms ease-in'}
              padding={'1rem'}
            >
              <Image
                src={ImageDefault}
                alt={'no image'}
                w={'100%'}
                maxW={'350px'}
                objectFit={'cover'}
                maxH={'200px'}
                mb={'10px'}
                loading={'lazy'}
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
                fontSize={'clamp(0.8rem, 0.2rem + 0.5vw, 1.5rem)'}
              >
                {store.city},{' '}
              </Text>
              <Text
                display={'inline'}
                textTransform={'capitalize'}
                fontStyle={'italic'}
                fontSize={'clamp(0.8rem, 0.2rem + 0.5vw, 1.5rem)'}
              >
                {store.province}
              </Text>
            </Box>
          ))}
        </Flex>
      ) : (
        <Heading textAlign={'center'}>you don&rsquo;t have any stores </Heading>
      )}
    </Box>
  );
};

export default MerchantStores;

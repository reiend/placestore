import { useState, useEffect } from 'react';
import { chakra, Skeleton, Heading } from '@chakra-ui/react';

import StoreList from '../Store/StoreList';
import StoreUrl from '../../../assets/store.jpg';

const Home = () => {
  const [isLoad, setIsLoad] = useState<boolean>(false);

  useEffect(() => {
    setTimeout(() => {
      setIsLoad(true);
    }, 1000);
  }, []);

  return (
    <chakra.main data-testid='home'>
      <Skeleton isLoaded={isLoad}>
        <chakra.div
          my={'5rem'}
          background={`url(${StoreUrl})`}
          backgroundSize={'cover'}
          width={'100%'}
          minH={'400px'}
          padding={'5rem'}
          position={'relative'}
          boxShadow={'xl'}
        >
          <Heading
            fontSize={'clamp(2rem, 2rem + 5vw, 5rem)'}
            textAlign={'center'}
            color={'white'}
            bg={'teal'}
            borderRadius={'var(--chakra-radii-md)'}
            padding={'20px'}
          >
            Store for masses
          </Heading>
        </chakra.div>
      </Skeleton>
      <StoreList />
    </chakra.main>
  );
};

export default Home;

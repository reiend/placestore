import { useState, useEffect } from 'react';
import { chakra, useDisclosure, Skeleton, Heading  } from '@chakra-ui/react';
import { Outlet } from 'react-router-dom';

import AppNavbar from '../App/AppNavbar';
import AppShopperAuthDrawer from '../App/AppShopperAuthDrawer';
import StoreUrl from '../../../assets/store.jpg';

const Home = () => {
  const { isOpen, onOpen, onClose } = useDisclosure();
  const [isLoad, setIsLoad] = useState<boolean>(false);

  const [authForm, setAuthForm] = useState<JSX.Element | string>('');

  useEffect(() => {
    setTimeout(() => {
      setIsLoad(true);
    }, 1000);
  }, []);

  const handleDrawerClick = () => onOpen();
  return (
    <chakra.main data-testid='home'>
      <AppNavbar
        handleDrawerClick={handleDrawerClick}
        setAuthForm={setAuthForm}
      />
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
            show your store to the world
          </Heading>
        </chakra.div>
      </Skeleton>
      <Outlet />
      <AppShopperAuthDrawer
        isOpen={isOpen}
        onClose={onClose}
        authForm={authForm}
      />
    </chakra.main>
  );
};

export default Home;

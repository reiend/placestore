import { chakra, Heading, Button } from '@chakra-ui/react';
import { Link } from 'react-router-dom';

const AppNavbar = () => {
  return (
    <chakra.nav
      position={'sticky'}
      top={'0'}
      display={'flex'}
      backgroundColor={'white'}
      padding={'2rem'}
      mb={'5rem'}
      justifyContent={'space-between'}
    >
      <chakra.div>
        <Link to={'/'}>
          <Heading color={'teal'} ml={'10px'}>
            placestore
          </Heading>
        </Link>
      </chakra.div>

      <chakra.div
        display={{ base: 'none', lg: 'flex' }}
        justifyContent={'space-between'}
        flexBasis={'250px'}
      >
        <Link to={'/merchant/signin'}>
          <Button variant={'outline'} colorScheme={'teal'}>
            merchant
          </Button>
        </Link>
        <Button variant={'solid'} colorScheme={'teal'}>
          shopper
        </Button>
      </chakra.div>
    </chakra.nav>
  );
};

export default AppNavbar;

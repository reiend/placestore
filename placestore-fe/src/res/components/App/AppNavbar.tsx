import { chakra, Heading, Button } from '@chakra-ui/react';
import { Link, useNavigate } from 'react-router-dom';

const AppNavbar = () => {
  const navigate = useNavigate();
  const handleMerchantSignout = () => {
    // remove merchant auth info
    localStorage.removeItem('merchantID');
    localStorage.removeItem('merchantEmail');
    localStorage.removeItem('authorization');
    localStorage.removeItem('role');

    // redirect to home
    navigate('/', { replace: true });
  };

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

      {localStorage.getItem('authorization') == null && (
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

          <Link to={'/wip'}>
            <Button variant={'solid'} colorScheme={'teal'}>
              shopper
            </Button>
          </Link>
        </chakra.div>
      )}

      {localStorage.getItem('authorization') != null &&
        localStorage.getItem('role') === 'store_admin' && (
          <chakra.div
            display={{ base: 'none', lg: 'flex' }}
            justifyContent={'space-between'}
            flexBasis={'250px'}
          >
            <Link to={'/merchant/dashboard'}>
              <Button variant={'outline'} colorScheme={'teal'}>
                dashboard
              </Button>
            </Link>

            <Button
              onClick={handleMerchantSignout}
              variant={'solid'}
              colorScheme={'teal'}
            >
              signout
            </Button>
          </chakra.div>
        )}
    </chakra.nav>
  );
};

export default AppNavbar;

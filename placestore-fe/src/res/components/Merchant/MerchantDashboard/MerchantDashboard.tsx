import { useEffect } from 'react';
import { useNavigate, Outlet, Link } from 'react-router-dom';
import { Box, Flex, Icon, Text } from '@chakra-ui/react';
import { CgProfile } from 'react-icons/cg';

const MerchantDashboard = () => {
  const navigate = useNavigate();

  useEffect(() => {
    const authorization = localStorage.getItem('authorization');
    const role = localStorage.getItem('role');

    // protect route needs to be merchant and signin
    if (!(authorization && role === 'store_admin'))
      navigate('/merchant/signin', { replace: true });
  });

  return (
    <Flex bg={'teal.50'} h={'700px'}>
      <Flex
        flex={'1'}
        bg={'teal.500'}
        m={'2rem'}
        flexDir={'column'}
        padding={'2rem'}
      >
        <Box alignSelf={'center'} textAlign={'center'} color={'white'}>
          <Icon as={CgProfile} fontSize={'5rem'} />
          <Text>{localStorage.getItem('merchantID')}</Text>
          <Text>{localStorage.getItem('merchantEmail')}</Text>
        </Box>

        <Box color={'teal.50'} fontSize={'1.5rem'} mt={'2rem'}>
          <Link to={'/merchant/dashboard'}>
            <Text
              backgroundColor={'white'}
              padding={'0.5rem'}
              color={'teal'}
              borderRadius={'var(--chakra--radii-md)'}
              mb={'2px'}
              _hover={{ backgroundColor: 'teal', color: 'white' }}
              transition={'200ms ease-ing'}
            >
              store list
            </Text>
          </Link>

          <Link to={'/merchant/dashboard/store/create'}>
            <Text
              backgroundColor={'white'}
              padding={'0.5rem'}
              color={'teal'}
              borderRadius={'var(--chakra--radii-md)'}
              mb={'2px'}
              _hover={{ backgroundColor: 'teal', color: 'white' }}
              transition={'200ms ease-ing'}
            >
              store create
            </Text>
          </Link>

          <Link to={'/merchant/dashboard/store/foods'}>
            <Text
              backgroundColor={'white'}
              padding={'0.5rem'}
              color={'teal'}
              borderRadius={'var(--chakra--radii-md)'}
              mb={'2px'}
              _hover={{ backgroundColor: 'teal', color: 'white' }}
              transition={'200ms ease-ing'}
            >
              food list
            </Text>
          </Link>

          <Link to={'/merchant/dashboard/store/food/create'}>
            <Text
              backgroundColor={'white'}
              padding={'0.5rem'}
              color={'teal'}
              borderRadius={'var(--chakra--radii-md)'}
              mb={'2px'}
              _hover={{ backgroundColor: 'teal', color: 'white' }}
              transition={'200ms ease-ing'}
            >
              food create
            </Text>
          </Link>
        </Box>
      </Flex>
      <Box
        flex={'3'}
        bg={'blue.50'}
        display={{ base: 'none', md: 'block' }}
        mx={'auto'}
        overflowY={'scroll'}
      >
        <Outlet />
      </Box>
    </Flex>
  );
};

export default MerchantDashboard;

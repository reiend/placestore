import { useRef } from 'react';
import { chakra, Heading, Button } from '@chakra-ui/react';
import { Link } from 'react-router-dom';

interface DrawerProps {
  handleDrawerClick: () => void;
  setAuthForm: (element: JSX.Element | string) => void;
}

const AppNavbar = ({ handleDrawerClick, setAuthForm }: DrawerProps) => {
  const buttonRef = useRef(null);

  const handleDrawerAuthClick = () => {
    handleDrawerClick();
    const authType = buttonRef.current.innerText;

    switch (authType) {
      case 'signup':
        setAuthForm('store customer signup is work in progress');
      case 'signin':
        setAuthForm('store customer signin is work in progress');
    }
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
        <Link to={'/home'}>
          <Heading color={'teal'} ml={'10px'}>
            placestore
          </Heading>
        </Link>
      </chakra.div>
      <chakra.div
        display={'flex'}
        justifyContent={'space-between'}
        flexBasis={'200px'}
      >
        <Button
          onClick={handleDrawerAuthClick}
          ref={buttonRef}
          variant={'outline'}
          colorScheme={'teal'}
        >
          signup
        </Button>
        <Button
          onClick={handleDrawerAuthClick}
          ref={buttonRef}
          variant={'solid'}
          colorScheme={'teal'}
        >
          signin
        </Button>
      </chakra.div>
    </chakra.nav>
  );
};

export default AppNavbar;

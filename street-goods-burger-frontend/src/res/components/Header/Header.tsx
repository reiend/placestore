import AuthenticationButton from './AuthenticationButton';
import Navbar from './Navbar';
import StoreLogo from '@globals/components/StoreLogo';
import { Link } from 'react-router-dom';

import './Header.scss';

const Header = () => {
  return (
    <header className='header'>
      <Link to='/home' data-testid='link-to-home'>
        <StoreLogo className='store-logo' data-testid='store-logo' />
      </Link>
      <div>
        <AuthenticationButton title='signin' />
        <AuthenticationButton title='signup' />
      </div>
      <Navbar items={['home', 'menu', 'about', 'contacts']} />
    </header>
  );
};

export default Header;

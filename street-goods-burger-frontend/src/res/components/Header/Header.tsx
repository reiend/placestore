import AuthenticationButton from './AuthenticationButton/index.ts';
import StoreLogo from '@globals/components/StoreLogo/index.ts';
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
    </header>
  );
};

export default Header;

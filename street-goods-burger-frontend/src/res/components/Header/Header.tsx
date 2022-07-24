import { Link } from 'react-router-dom';

import AuthenticationButton from './AuthenticationButton';
import Navbar from './Navbar';
import Brand from '../../globals/components/Brand'; // for some reason using alias here remove types checking

import StreetGoodsBurgerLogoUrl from '@assets/StreetGoodsBurgerLogo.jpg';

import './Header.scss';

const Header = () => {
  return (
    <header className='header'>
      <Link to='/home' data-testid='link-to-home'>
        <Brand
          className='store-logo'
          data-testid='store-logo'
          src={StreetGoodsBurgerLogoUrl}
          alt='Brand Logo'
          title='Brand Logo'
        />
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

import { useState } from 'react';
import { Link } from 'react-router-dom';

import Navbar from './Navbar';
import Drawer from './Drawer';
import DrawerContent from './DrawerContent';
import Brand from '../../globals/components/Brand'; // for some reason using alias here remove types checking
import Button from '../../globals/components/Button'; // for some reason using alias here remove types checking

import StreetGoodsBurgerLogoUrl from '@assets/StreetGoodsBurgerLogo.jpg';
import './Header.scss';

// whitelist styles
// dont purge this styles
// drawer--open
// drawer
// drawer-content
// drawer-content__navbar
// drawer-content__navbar--open
// drawer-content__signup
// drawer-content__signin

const Header = () => {
  const [open, setOpen] = useState<boolean>(false);

  const handleOpen = () => {
    setOpen(open => !open);
  };

  return (
    <header className='header'>
      <div className='header__top'>
        <Link to='/home' data-testid='link-to-home'>
          <Brand
            className='brand'
            data-testid='brand'
            src={StreetGoodsBurgerLogoUrl}
            alt='Brand Logo'
            title='Street Goods Burger Logo'
          />
        </Link>
        <div className='header__buttons'>
          <Link to='/signin'>
            <Button className='signin' title='signin' />
          </Link>
          <Link to='/signup'>
            <Button className='signup' title='signup' />
          </Link>
          <Drawer
            className='drawer'
            open={open}
            onClick={handleOpen}
            data-testid='drawer'
          />
        </div>
      </div>
      <Navbar
        className='navbar'
        items={['home', 'menu', 'about', 'contacts']}
      />
      {open && (
        <DrawerContent
          className='drawer-content'
          data-testid='drawer-content'
        />
      )}
    </header>
  );
};

export default Header;

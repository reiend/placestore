import React from 'react';

import AuthenticationButton from './AuthenticationButton/index.ts';
import StoreLogo from '@globals/components/StoreLogo/index.ts';
import { Link } from 'react-router-dom';

import './Header.scss';

const Header = () => {
  return (
    <header className='header'>
      <Link to='/home' role='link-to-home'>
        <StoreLogo role='store-logo' className='store-logo' />
      </Link>
      <div>
        <AuthenticationButton role='signin-button' title='signin' />
        <AuthenticationButton role='signup-button' title='signup' />
      </div>
    </header>
  );
};

export default Header;

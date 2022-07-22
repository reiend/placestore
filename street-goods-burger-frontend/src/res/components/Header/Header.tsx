import React from 'react';

import AuthenticationButton from './AuthenticationButton/index.ts';
import './Header.scss';

const Header = () => {
  return (
    <header className='header'>
      <svg role='store-logo'></svg>
      <div>
        <AuthenticationButton role='signin-button' title='signin' />
        <AuthenticationButton role='signup-button' title='signup' />
      </div>
    </header>
  );
};

export default Header;

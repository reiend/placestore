import React from 'react';

import './Header.scss';

const Header = () => {
  return (
    <header className='header'>
      <svg role='store-logo'></svg>
      <div>
        <button role='signin-button'>signin</button>
        <button role='signup-button'>signup</button>
      </div>
    </header>
  );
};

export default Header;

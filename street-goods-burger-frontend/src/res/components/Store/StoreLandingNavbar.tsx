import React from 'react';
import StreetGoodsBurgerLogo
  from '@globals/components/StreetGoodsBurgerLogo.tsx';

const StoreLandingNavbar = () => {
  return (
    <nav className="store-navbar container mx-auto">
      <button className="store-navbar__signin-button">signin</button>
      <StreetGoodsBurgerLogo className="store-navbar__logo" />
      <button className="store-navbar__signup-button">signup</button>
    </nav>
  );
};
export default StoreLandingNavbar;

import React from "react";
import StreetGoodsBurgerLogo from "@globals/components/StreetGoodsBurgerLogo.tsx";

const StoreLandingNavbar = () => {
  return (
    <nav className="store-navbar">
      <button className="store-navbar__signin">signin</button>
      <StreetGoodsBurgerLogo className="store-navbar__logo" />
      <button>signup</button>
    </nav>
  );
};

export default StoreLandingNavbar;

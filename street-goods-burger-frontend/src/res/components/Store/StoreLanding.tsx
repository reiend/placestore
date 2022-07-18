import React from 'react';
import StoreLandingNavbar from './StoreLandingNavbar.tsx';

const StoreLanding = () => {
  return (
    <div data-testid='landing' className='landing'>
      <div className='header'></div>
      <div className='welcome'></div>
      <div className='menu'></div>
      <div className='about'></div>
      <div className='contacts'></div>
    </div>
  );
};

export default StoreLanding;

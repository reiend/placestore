import React from 'react';
import './Home.scss';

const Home = () => {
  return (
    <div data-testid='home' className='home'>
      <div className='header'></div>
      <div className='welcome'></div>
      <div className='menu'></div>
      <div className='about'></div>
      <div className='contacts'></div>
    </div>
  );
};

export default Home;

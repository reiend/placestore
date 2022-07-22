import React from 'react';

import Header from '@components/Header/index.ts';
import './Home.scss';

const Home = () => {
  return (
    <div data-testid='home' className='home'>
      <Header />
      <div className='welcome'></div>
      <div className='menu'></div>
      <div className='about'></div>
      <div className='contacts'></div>
    </div>
  );
};

export default Home;

import React from 'react';

import Header from '@components/Header/index.ts';
import './Home.scss';

const Home = () => {
  return (
    <main data-testid='home' className='home'>
      <Header />
      <div className='welcome'></div>
      <div className='menu'></div>
      <div className='about'></div>
      <div className='contacts'></div>
    </main>
  );
};

export default Home;
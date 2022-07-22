import React, { Fragment } from 'react';

import '@libs/reiend/scss/index.scss';
import './App.scss';

import StoreLanding from '@components/Store/StoreLanding.tsx';

const App = () => {
  return (
    <Fragment>
      <StoreLanding />
      <div className='test'></div>
    </Fragment>
  );
};

export default App;

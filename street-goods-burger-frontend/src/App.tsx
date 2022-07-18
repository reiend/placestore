import React, { Fragment } from 'react';
import '@libs/reiend/scss/index.scss';
import '@styles/scss/app.scss';

import StoreLanding from '@components/Store/StoreLanding.tsx';

const App = () => {
  return (
    <Fragment>
      <StoreLanding />
    </Fragment>
  );
};

export default App;

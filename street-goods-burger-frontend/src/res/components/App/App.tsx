import React, { Fragment } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';

import Home from '@components/Home/index.ts';
import '@libs/reiend/scss/index.scss';
import './App.scss';

const App = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Home />}></Route>
      </Routes>
    </BrowserRouter>
  );
};

export default App;

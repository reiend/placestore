import { BrowserRouter, Routes, Route } from 'react-router-dom';

import Home from '@components/Home';
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

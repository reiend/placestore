import { HashRouter, Routes, Route } from 'react-router-dom';

import Home from '@components/Home';
import './App.scss';

const App = () => {
  return (
    <HashRouter>
      <Routes>
        <Route path='/' element={<Home />}></Route>
      </Routes>
    </HashRouter>
  );
};

export default App;

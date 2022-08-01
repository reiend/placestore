import { HashRouter, Routes, Route } from 'react-router-dom';
import { ChakraProvider } from '@chakra-ui/react';

import Home from '../Home';

const App = () => {
  return (
    <ChakraProvider>
      <HashRouter>
        <Routes>
          <Route path='/' element={<Home />}></Route>
        </Routes>
      </HashRouter>
    </ChakraProvider>
  );
};

export default App;

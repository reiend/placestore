import { HashRouter } from 'react-router-dom';
import { ChakraProvider } from '@chakra-ui/react';

import AppNavbar from './AppNavbar';
import AppRoutes from './AppRoutes';

const App = () => {
  return (
    <ChakraProvider>
      <HashRouter>
        <AppNavbar />
        <AppRoutes />
      </HashRouter>
    </ChakraProvider>
  );
};

export default App;

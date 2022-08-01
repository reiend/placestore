import { ChakraProvider } from '@chakra-ui/react';

import AppRoutes from './AppRoutes';

const App = () => {
  return (
    <ChakraProvider>
      <AppRoutes />
    </ChakraProvider>
  );
};

export default App;

import { HashRouter, Routes, Route } from 'react-router-dom';
import Home from '../Home';
import StoreList from '../Store/StoreList';
import MerchantSignup from '../Merchant/MerchantSignup';

const AppRoutes = () => {
  return (
    <HashRouter>
      <Routes>
        <Route path='/' element={<Home />}>
          <Route index path='/home' element={<StoreList />}></Route>
          <Route path='/merchant/signup' element={<MerchantSignup />}></Route>
        </Route>
      </Routes>
    </HashRouter>
  );
};

export default AppRoutes;

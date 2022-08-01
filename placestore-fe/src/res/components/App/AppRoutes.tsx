import { Routes, Route } from 'react-router-dom';
import Home from '../Home';
import MerchantSignin from '../Merchant/MerchantSignin';
import MerchantSignup from '../Merchant/MerchantSignup';

const AppRoutes = () => {
  return (
    <Routes>
      <Route path='/' element={<Home />}></Route>
      <Route path='/merchant/signin' element={<MerchantSignin />} />
      <Route path='/merchant/signup' element={<MerchantSignup />} />
    </Routes>
  );
};

export default AppRoutes;

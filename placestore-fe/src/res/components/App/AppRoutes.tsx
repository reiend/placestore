import { Routes, Route } from 'react-router-dom';
import Home from '../Home';
import MerchantSignin from '../Merchant/MerchantSignin';
import MerchantSignup from '../Merchant/MerchantSignup';
import MerchantDashboard from '../Merchant/MerchantDashboard';
import AppWIP from './AppWIP';

const AppRoutes = () => {
  return (
    <Routes>
      <Route path='/' element={<Home />}></Route>
      <Route path='/merchant/signin' element={<MerchantSignin />} />
      <Route path='/merchant/signup' element={<MerchantSignup />} />
      <Route path='/merchant/dashboard' element={<MerchantDashboard />} />
      <Route path='/wip' element={<AppWIP />} />
    </Routes>
  );
};

export default AppRoutes;

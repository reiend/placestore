import { Routes, Route } from 'react-router-dom';
import Home from '../Home';
import MerchantSignin from '../Merchant/MerchantSignin';
import MerchantSignup from '../Merchant/MerchantSignup';
import MerchantDashboard from '../Merchant/MerchantDashboard';
import MerchantStores from '../Merchant/MerchantStores';
import MerchantFoods from '../Merchant/MerchantFoods';
import MerchantFoodCreate from '../Merchant/MerchantFoodCreate';
import StoreCreate from '../Store/StoreCreate';
import StoreFoods from '../Store/StoreFoods';
import AppWIP from './AppWIP';

const AppRoutes = () => {
  return (
    <Routes>
      <Route path='/' element={<Home />}></Route>
      <Route path='/merchant/signin' element={<MerchantSignin />} />
      <Route path='/merchant/signup' element={<MerchantSignup />} />
      <Route path='/merchant/dashboard' element={<MerchantDashboard />}>
        <Route index element={<MerchantStores />} />
        <Route path={'store/create'} element={<StoreCreate />} />
        <Route path={'store/foods'} element={<MerchantFoods />} />
        <Route path={'store/food/create'} element={<MerchantFoodCreate />} />
      </Route>
      <Route path='/wip' element={<AppWIP />} />
      <Route path='/store/foods' element={<StoreFoods />} />
    </Routes>
  );
};

export default AppRoutes;

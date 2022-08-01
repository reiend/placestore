import MerchantSignin from '../Merchant/MerchantSignin';
import MerchantSignup from '../Merchant/MerchantSignup';
import MerchantFoodCreate from '../Merchant/MerchantFoodCreate';
import StoreCreate from '../Store/StoreCreate';
import StoreList from '../Store/StoreList';

const Home = () => {
  return (
    <div data-testid='home'>
      <StoreList />
      <MerchantSignin />
      <MerchantSignup />
      <StoreCreate />
      <MerchantFoodCreate />
    </div>
  );
};

export default Home;

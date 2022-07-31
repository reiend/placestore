import MerchantSignin from '../Merchant/MerchantSignin';
import MerchantSignup from '../Merchant/MerchantSignup';
import MerchantFoodCreate from '../Merchant/MerchantFoodCreate';
import StoreCreate from '../Store/StoreCreate';

const Home = () => {
  return (
    <div data-testid='home'>
      <MerchantSignin />
      <MerchantSignup />
      <StoreCreate />
      <MerchantFoodCreate />
    </div>
  );
};

export default Home;

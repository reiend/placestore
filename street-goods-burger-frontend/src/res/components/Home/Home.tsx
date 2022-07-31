import MerchantSignin from '../Merchant/MerchantSignin';
import MerchantSignup from '../Merchant/MerchantSignup';
import StoreCreate from '../Store/StoreCreate';

const Home = () => {
  return (
    <div data-testid='home'>
      <MerchantSignin />
      <MerchantSignup />
      <StoreCreate />
    </div>
  );
};

export default Home;

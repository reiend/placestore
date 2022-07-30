import MerchantSignin from '../Merchant/MerchantSignin';
import MerchantSignup from '../Merchant/MerchantSignup';

const Home = () => {
  return (
    <div data-testid='home'>
      <MerchantSignin />
      <MerchantSignup />
    </div>
  );
};

export default Home;

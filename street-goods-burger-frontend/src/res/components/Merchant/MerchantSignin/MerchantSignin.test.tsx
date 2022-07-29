import { render, screen } from '@testing-library/react';
import axios from 'axios';

import MerchantSignin, { merchantSignin } from './MerchantSignin';

// Mock jest and set the type
jest.mock('axios');

const mockedAxios = axios as jest.MockedFunction<typeof axios>;

describe('MerchantSignin', () => {
  // const component = <MerchantSignin />;

  // Test if store admin signin request are called

  it('Should return a value when signin request call', async () => {
    const res = {
      data: {
        id: 'merchantID',
        email: 'merchant@gmail.com'
      }
    };

    const email = 'admin@gmail.com';
    const password = 'admin12345';
    const url = 'http://localhost:3000/store_admin/signin';

    mockedAxios.mockReturnValueOnce(res as any);

    const data = await merchantSignin(email, password, url);

    expect(mockedAxios).toHaveBeenCalled();
    expect(data).toEqual(res);
  });

  it('Should a text Siginin as Merchant', async () => {
    render(<MerchantSignin />);

    expect(screen.getByText(/signin as merchant/i)).toBeInTheDocument();
  });
});

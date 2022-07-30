import { render, screen } from '@testing-library/react';
import axios from 'axios';

import MerchantSignup, { merchantSignup } from './MerchantSignup';

// Mock jest and set the type
jest.mock('axios');

const mockedAxios = axios as jest.MockedFunction<typeof axios>;

describe('MerchantSignup', () => {
  // const component = <MerchantSignup />;

  // Test if store admin signup request are called
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

    const data = await merchantSignup(email, password, url);

    expect(mockedAxios).toHaveBeenCalled();
    expect(data).toEqual(res);
  });

  it('Should have a heading text siginup as Merchant', async () => {
    render(<MerchantSignup />);

    expect(
      screen.getByText(/signup as merchant/i) as HTMLHeadingElement
    ).toBeInTheDocument();
  });
});

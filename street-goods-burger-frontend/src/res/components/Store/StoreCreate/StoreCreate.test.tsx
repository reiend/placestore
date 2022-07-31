import { render, screen } from '@testing-library/react';
import axios from 'axios';

import StoreCreate, { storeCreate } from './StoreCreate';

// Mock jest and set the type
jest.mock('axios');

const mockedAxios = axios as jest.MockedFunction<typeof axios>;

describe('MerchantSignin', () => {
  // Test if store create has been called
  it('Should return a value when store create request call when signin', async () => {
    const res = {
      data: {
        id: 40,
        name: 'store1',
        line1: 'line1',
        line2: 'line2',
        postal_code: '6666',
        city: 'city1',
        province: 'province1',
        created_at: '2022-07-31T17:54:39.821+08:00',
        updated_at: '2022-07-31T17:54:39.821+08:00',
        store_admin_id: 1
      }
    };

    const name = 'store1';
    const line1 = 'line1';
    const line2 = 'line2';
    const postalCode = '6666';
    const city = 'city1';
    const province = 'province1';
    const url = 'http://localhost:3000/store';
    const authorization = JSON.stringify('secretKey');

    mockedAxios.mockReturnValueOnce(res as any);

    const data = await storeCreate(
      name,
      line1,
      line2,
      postalCode,
      city,
      province,
      authorization,
      url
    );

    expect(JSON.parse(authorization)).not.toBeNull();
    expect(JSON.parse(authorization)).not.toEqual('');
    expect(mockedAxios).toHaveBeenCalled();
    expect(data).toEqual(res);
  });

  it('Should have a heading text create a store', async () => {
    render(<StoreCreate />);

    expect(
      screen.getByText(/create a store/i) as HTMLHeadingElement
    ).toBeInTheDocument();
  });
});

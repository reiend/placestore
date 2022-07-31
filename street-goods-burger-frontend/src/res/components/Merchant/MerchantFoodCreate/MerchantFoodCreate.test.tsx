import { render, screen } from '@testing-library/react';
import axios from 'axios';

import MerchantFoodCreate, { merchantFoodCreate } from './MerchantFoodCreate';

// Mock jest and set the type
jest.mock('axios');

const mockedAxios = axios as jest.MockedFunction<typeof axios>;

describe('MerchantfoodCreate', () => {
  // Test if store create has been called
  it('Should return a value when food create request call when signin', async () => {
    const res = {
      data: {
        id: 17,
        name: 'Burgerqr5',
        price: '100.1',
        category: 'Burger',
        description: 'Burger5',
        like: 0,
        discount: '0.0',
        is_available: true,
        picture: 'cloudinary.com/test.png',
        picture_id: 'store/street-goods-burger/testID.png',
        created_at: '2022-07-31T23:59:34.347+08:00',
        updated_at: '2022-07-31T23:59:34.347+08:00',
        store_id: 1
      }
    };

    const name = 'name1';
    const category = 'category1';
    const description = 'description1';
    const price = 141.51;
    const imagePath = './test.png';
    const storeID = 1;
    const url = 'http://localhost:3000/food';
    const authorization = JSON.stringify('secretKey');

    mockedAxios.mockReturnValueOnce(res as any);

    const data = await merchantFoodCreate(
      name,
      category,
      description,
      price.toString(),
      imagePath,
      storeID,
      authorization,
      url
    );

    expect(JSON.parse(authorization)).not.toBeNull();
    expect(JSON.parse(authorization)).not.toEqual('');
    expect(mockedAxios).toHaveBeenCalled();
    expect(data).toEqual(res);
  });

  it('Should have a heading text, create a food', async () => {
    render(<MerchantFoodCreate />);

    expect(
      screen.getByText(/create a food/i) as HTMLHeadingElement
    ).toBeInTheDocument();
  });
});

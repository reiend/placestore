import React from 'react';
import { render } from '@testing-library/react';
import App from './index.ts';

describe('App', () => {
  // Test if the component renders without crashing
  it('Should renders without crashing', () => {
    render(<App />);
  });

  // Test if the component has home component
  it('Should have a Home component', () => {
    const { getByTestId } = render(<App />);

    expect(getByTestId('home')).toBeInTheDocument();
  });
});

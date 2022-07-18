import React from 'react';
import { render } from '@testing-library/react';
import App from '@src/App.tsx';

describe('App', () => {
  it('Should renders without crashing', () => {
    render(<App />);
  });

  it('Should have a landing page', () => {
    const { getByTestId } = render(<App />);

    expect(getByTestId('landing')).toBeInTheDocument();
  });
});

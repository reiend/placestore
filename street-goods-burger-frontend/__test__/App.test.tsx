import React from 'react';
import { render } from '@testing-library/react';
import App from '@src/App.tsx';

describe('App', () => {
  // Test if the component renders without crashing
  it('Should renders without crashing', () => {
    render(<App />);
  });

  // Test if the component has landing page component
  it('Should have a landing page', () => {
    const { getByTestId } = render(<App />);

    expect(getByTestId('landing')).toBeInTheDocument();
  });
});

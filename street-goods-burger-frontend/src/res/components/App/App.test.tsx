import { render, screen } from '@testing-library/react';

import App from './App';

describe('App', () => {
  beforeEach(() => {
    render(<App />);
  });

  // Test if the component has home component
  it('Should have a Home component', () => {
    const mainElement = screen.getByTestId('home');
    expect(mainElement).toBeInTheDocument();
  });
});

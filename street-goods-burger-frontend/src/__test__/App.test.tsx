import React from 'react';
import { render } from '@testing-library/react';
import App from '@src/App.tsx';

describe('App', () => {
  type AppChildrenTypes = [string, string, string, string, string];
  const appChildren: AppChildrenTypes = [
    'header',
    'welcome',
    'menu',
    'about',
    'contacts',
  ];

  it('Should renders without crashing', () => {
    render(<App />);
  });

  it(`Should have ${
    appChildren.length
  } children only namely, ${appChildren.join(', ')}`, () => {
    const { getByTestId } = render(<App />);

    appChildren.forEach(child => {
      const element = getByTestId(child);
      expect(element).toBeInTheDocument();
    });
  });
});

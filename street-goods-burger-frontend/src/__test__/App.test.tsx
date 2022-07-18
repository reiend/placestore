import React from 'react';
import { render } from '@testing-library/react';
import App from '@src/App.tsx';

describe('App', () => {
  type AppChildrenTypes = readonly [string, string, string, string, string];
  // list of children on app component
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
      expect(appChildren.length).toBe(5);
    });
  });
});

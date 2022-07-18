import React from 'react';
import { render } from '@testing-library/react';
import StoreLanding from '@components/Store/StoreLanding.tsx';

describe('StoreLanding', () => {
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
    render(<StoreLanding />);
  });

  it(`Should have ${
    appChildren.length
  } children, only namely, ${appChildren.join(', ')}`, () => {
    const { getByTestId } = render(<StoreLanding />);

    Object.entries(getByTestId('landing').children).forEach((child, i) => {
      expect(child[1].className == appChildren[i]);
    });

    expect(getByTestId('landing').children).toHaveLength(5);
  });
});

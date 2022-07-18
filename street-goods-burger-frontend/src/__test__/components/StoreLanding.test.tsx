import React from 'react';
import { render } from '@testing-library/react';
import StoreLanding from '@components/Store/StoreLanding.tsx';

describe('StoreLanding', () => {
  type StoreLandingChildrenTypes = readonly [string, string, string, string, string];
  // list of children on StoreLanding component
  const StoreLandingChildren: StoreLandingChildrenTypes = [
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
  } children, only namely, ${StoreLandingChildren.join(', ')}`, () => {
    const { getByTestId } = render(<StoreLanding />);

    Object.entries(getByTestId('landing').children).forEach((child, i) => {
      expect(child[1].className == StoreLandingChildren[i]);
    });

    expect(getByTestId('landing').children).toHaveLength(5);
  });
});

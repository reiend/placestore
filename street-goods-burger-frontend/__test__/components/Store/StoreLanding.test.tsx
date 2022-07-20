import React from 'react';
import { render } from '@testing-library/react';
import StoreLanding from '@components/Store/StoreLanding.tsx';

describe('StoreLanding', () => {
  type StoreLandingChildrenTypes = readonly [
    string,
    string,
    string,
    string,
    string
  ];

  // list of children on app component
  const storeLandingChildren: StoreLandingChildrenTypes = [
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
    storeLandingChildren.length
  } children, only namely, ${storeLandingChildren.join(', ')}`, () => {
    const { getByTestId } = render(<StoreLanding />);
    const ClassNameIndex = 1;
    const ChildrenMaxLength = 5;

    Object.entries(getByTestId('landing').children).forEach((child, i) => {
      expect(child[ClassNameIndex].className == storeLandingChildren[i]);
    });

    expect(getByTestId('landing').children).toHaveLength(ChildrenMaxLength);
  });
});

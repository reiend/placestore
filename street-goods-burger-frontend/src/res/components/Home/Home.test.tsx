import React from 'react';
import { render } from '@testing-library/react';
import Home from './index.ts';

describe('Home', () => {
  type HomeChildrenTypes = readonly [string, string, string, string, string];

  // list of children on app component
  const homeChildren: HomeChildrenTypes = [
    'header',
    'welcome',
    'menu',
    'about',
    'contacts',
  ];

  // Test if the component renders without crashing
  it('Should renders without crashing', () => {
    render(<Home />);
  });

  // Test if the component has 5 children
  // Test if the component children has class, header, welcome, menu, about, contacts
  it(`Should have ${
    homeChildren.length
  } children, only namely, ${homeChildren.join(', ')}`, () => {
    const { getByTestId } = render(<Home />);
    const ClassNameIndex = 1;
    const ChildrenMaxLength = 5;

    Object.entries(getByTestId('home').children).forEach((child, i) => {
      expect(child[ClassNameIndex].className == homeChildren[i]);
    });

    expect(getByTestId('home').children).toHaveLength(ChildrenMaxLength);
  });
});

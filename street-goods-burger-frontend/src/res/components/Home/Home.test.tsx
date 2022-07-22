import React from 'react';
import { BrowserRouter } from 'react-router-dom';
import { render, screen } from '@testing-library/react';

import Home from './index.ts';

const MockHome = () => {
  return (
    <BrowserRouter>
      <Home />
    </BrowserRouter>
  );
};

describe('Home', () => {
  beforeEach(() => {
    render(<MockHome />);
  });

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
  it('Should renders without crashing', () => {});

  // Test if the component has 5 children
  // Test if the component children has class, header, welcome, menu, about, contacts
  it(`Should have ${
    homeChildren.length
  } children, only namely, ${homeChildren.join(', ')}`, () => {
    const ClassNameIndex = 1;
    const ChildrenMaxLength = 5;

    const mainElement = screen.getByTestId('home');

    Object.entries(mainElement.children).forEach((child, i) => {
      expect(child[ClassNameIndex].className == homeChildren[i]);
    });

    expect(mainElement.children).toHaveLength(ChildrenMaxLength);
  });
});

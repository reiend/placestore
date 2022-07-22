import React from 'react';
import { render, screen } from '@testing-library/react';
import Header from './Header.tsx';

describe('Header', () => {
  beforeEach(() => {
    render(<Header />);
  });
  // Test if the component renders without crashing
  it('Should renders without crashing', () => {});

  // Test if the component has store logo in the document
  it('Should renders a store logo', () => {
    const svgElement = screen.getByRole('store-logo') as HTMLOrSVGElement;
    expect(svgElement).toBeInTheDocument();
  });

  // Test if the component has a signin button document
  it('Should renders a signin button', () => {
    const buttonElement = screen.getByRole(
      'signin-button'
    ) as HTMLButtonElement;
    expect(buttonElement).toBeInTheDocument();
  });

  // Test if the component has a signup button document
  it('Should renders a signup button', () => {
    const buttonElement = screen.getByRole(
      'signup-button'
    ) as HTMLButtonElement;
    expect(buttonElement).toBeInTheDocument();
  });
});

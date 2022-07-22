import React from 'react';
import { BrowserRouter } from 'react-router-dom';
import { render, screen, fireEvent } from '@testing-library/react';
import { createMemoryHistory } from 'history';

import Header from './Header.tsx';

// wrapped in BrowserRouter cause it renders a Link
const MockHeader = () => {
  return (
    <BrowserRouter>
      <Header />
    </BrowserRouter>
  );
};

describe('Header', () => {
  beforeEach(() => {
    render(<MockHeader />);
  });
  // Test if the component renders without crashing
  it('Should renders without crashing', () => {});

  // Test if the component has store logo in the document
  it('Should renders a store logo', () => {
    const svgElement = screen.getByTestId('store-logo') as HTMLOrSVGElement;
    expect(svgElement).toBeInTheDocument();
  });

  // Test if the component store logo when click bring the page to root route or home
  it('Should go to root or home route when click store logo', () => {
    const linkElement = screen.getByTestId('link-to-home') as HTMLLinkElement;
    const getCurrentWindowUrl = () => window.location.pathname;

    expect(getCurrentWindowUrl()).not.toBe('/home');
    fireEvent.click(linkElement);
    expect(getCurrentWindowUrl()).toBe('/home');
  });

  // Test if the component has a signin button document
  it('Should renders a signin button', () => {
    const buttonElement = screen.getByRole('button', {
      name: 'signin',
    }) as HTMLButtonElement;
    expect(buttonElement).toBeInTheDocument();
  });

  // Test if the component has a signup button document
  it('Should renders a signup button', () => {
    const buttonElement = screen.getByRole('button', {
      name: 'signup',
    }) as HTMLButtonElement;
    expect(buttonElement).toBeInTheDocument();
  });
});

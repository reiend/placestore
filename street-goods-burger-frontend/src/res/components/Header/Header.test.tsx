import { BrowserRouter } from 'react-router-dom';
import { render, screen, fireEvent } from '@testing-library/react';

import Header from './Header';

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

  // Test if the component has brand in the document
  it('Should renders a brand', () => {
    const divElement = screen.getByTestId('brand') as HTMLDivElement;
    expect(divElement).toBeInTheDocument();
  });

  // Test if the component brand when click bring the page to root route or home
  it('Should go to root or home route when click brand', () => {
    const linkElement = screen.getByTestId('link-to-home') as HTMLLinkElement;
    const getCurrentWindowUrl = () => window.location.pathname;

    expect(getCurrentWindowUrl()).not.toBe('/home');
    fireEvent.click(linkElement);
    expect(getCurrentWindowUrl()).toBe('/home');
  });

  // Test if the component has a signin button document
  it('Should renders a signin button', () => {
    const buttonElement = screen.getByRole('button', {
      name: 'signin'
    }) as HTMLButtonElement;
    expect(buttonElement).toBeInTheDocument();
  });

  // Test if the component has a signup button document
  it('Should renders a signup button', () => {
    const buttonElement = screen.getByRole('button', {
      name: 'signup'
    }) as HTMLButtonElement;
    expect(buttonElement).toBeInTheDocument();
  });

  // Test if the component when click bring the page to signin
  it('Should go to signup route when click signin button', () => {
    const linkElement = screen.getByRole('link', {
      name: 'signin'
    }) as HTMLLinkElement;
    const getCurrentWindowUrl = () => window.location.pathname;

    expect(getCurrentWindowUrl()).not.toBe('/signin');
    fireEvent.click(linkElement);
    expect(getCurrentWindowUrl()).toBe('/signin');
  });

  // Test if the component when click bring the page to signup
  it('Should go to signup route when click signup button', () => {
    const linkElement = screen.getByRole('link', {
      name: 'signup'
    }) as HTMLLinkElement;
    const getCurrentWindowUrl = () => window.location.pathname;

    expect(getCurrentWindowUrl()).not.toBe('/signup');
    fireEvent.click(linkElement);
    expect(getCurrentWindowUrl()).toBe('/signup');
  });

  // Test if the drawer has the className--open when click
  it(`should have the same className--open pass on props`, () => {
    const svgElement = screen.getByTestId('drawer') as HTMLOrSVGScriptElement;
    fireEvent.click(svgElement);
    expect(svgElement).toHaveClass('drawer--open');
  });

  // Test if the drawer content isn't visible if drawer was clase
  it(`should not be visible drawer content when drawer is close`, () => {
    const divElement = screen.queryByTestId('drawer-content') as HTMLDivElement;
    expect(divElement).toBe(null);
  });
});

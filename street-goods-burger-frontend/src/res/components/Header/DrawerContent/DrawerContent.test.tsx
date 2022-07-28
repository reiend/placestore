import { render, screen } from '@testing-library/react';
import { BrowserRouter } from 'react-router-dom';

import DrawerContent from './DrawerContent';
import { DrawerContentProps } from './utils';
import { NavbarProps } from '../Navbar/utils';

// wrapped in BrowserRouter cause it renders a Link
const MockDrawerContent = (props: DrawerContentProps) => {
  return (
    <BrowserRouter>
      <DrawerContent {...props} />
    </BrowserRouter>
  );
};

describe('DrawerContent', () => {
  const props: DrawerContentProps = {
    className: 'drawer-content',
    ['data-testid']: 'drawer-content'
  };

  const navbarProps: NavbarProps = {
    items: ['home', 'stores', 'contacts']
  };

  beforeEach(() => {
    render(<MockDrawerContent {...props} />);
  });

  // Test if the component have a text home, menu, about, contacts
  it(`Should render the texts ${navbarProps.items}`, () => {
    navbarProps.items.forEach(item => {
      const liElement = screen.getByText(item) as HTMLLIElement;
      expect(liElement).toBeInTheDocument();
    });
  });

  // Test if the component have a signin button
  it(`Should renders a signin button`, () => {
    const buttonElement = screen.getByRole('button', {
      name: 'signin'
    }) as HTMLButtonElement;
    expect(buttonElement).toBeInTheDocument();
  });

  // Test if the component have a signup button
  it(`Should renders a signup button`, () => {
    const buttonElement = screen.getByRole('button', {
      name: 'signup'
    }) as HTMLButtonElement;
    expect(buttonElement).toBeInTheDocument();
  });
});

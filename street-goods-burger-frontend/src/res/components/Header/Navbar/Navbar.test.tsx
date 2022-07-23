import { render, screen } from '@testing-library/react';

import Navbar from './Navbar';

describe('Navbar', () => {
  interface NavbarProps {
    items: readonly [string, string, string, string];
  }
  // list of possible items on the navbar
  const props: NavbarProps = {
    items: ['home', 'menu', 'about', 'contacts']
  };

  beforeEach(() => {
    render(<Navbar {...props} />);
  });

  // Test if the component has the same item pass on props
  it('Should have the same items pass on props ', async () => {
    const linkElements = await screen.findAllByRole('link');

    linkElements.forEach((link, i) => {
      expect(link.textContent).toBe(props.items[i]);
    });
  });

  // Test if the component has the maximum number of links
  it('Should have the same items pass on props ', () => {
    const linkElements = screen.getAllByRole('link');
    const NavbarMaxLink = 4;
    expect(linkElements).toHaveLength(NavbarMaxLink);
  });
});

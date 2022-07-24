import { render, screen } from '@testing-library/react';

import Navbar from './Navbar';
import { NavbarProps } from './utils';

describe('Navbar', () => {
  // list of possible items on the navbar
  const props: NavbarProps = {
    className: 'navbar',
    items: ['home', 'menu', 'about', 'contacts']
  };

  beforeEach(() => {
    render(<Navbar {...props} />);
  });

  const { className, items } = props;

  // Test if the component has the same className pass on props
  it('Should have the same className pass on props ', () => {
    const navElement = screen.getByRole('navigation');
    // if className exist, assert
    className && expect(navElement).toHaveClass(className);
  });

  // Test if the component has the same item pass on props
  it('Should have the same items pass on props ', async () => {
    const linkElements = await screen.findAllByRole('link');

    linkElements.forEach((link, i) => {
      expect(link.textContent).toBe(items[i]);
    });
  });

  // Test if the component has the maximum number of links
  it('Should have the same items pass on props ', () => {
    const linkElements = screen.getAllByRole('link');
    const NavbarMaxLink = 4;
    expect(linkElements).toHaveLength(NavbarMaxLink);
  });

  // Test if the component corresponding element, in order
  it('Should be in order and when click navigate to corresponding element', () => {
    // if array length is 1 when do split meaning it doesn't find doesn't match the item
    const NotFoundArrayLength = 1;
    items.forEach(item => {
      const linkElement = screen.getByRole('link', {
        name: item
      }) as HTMLLinkElement;
      const linkArray = linkElement.href.split(`/#${item}`);
      expect(linkArray).not.toHaveLength(NotFoundArrayLength);
    });
  });
});

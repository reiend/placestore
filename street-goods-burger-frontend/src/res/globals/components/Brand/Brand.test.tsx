import { render, screen } from '@testing-library/react';

import Brand from './Brand';
import { BrandProps } from './utils';

describe('StoreLogo', () => {
  const props: BrandProps = {
    className: 'store-logo',
    src: 'brandPath',
    alt: 'brand',
    title: 'brand',
    ['data-testid']: 'store-logo'
  };

  beforeEach(() => {
    render(<Brand {...props} />);
  });

  const { className, src, alt, title, ['data-testid']: testID } = props;

  // Test if the component has the same className pass on props
  it('Should have the same classname pass on props', () => {
    const imageElement = screen.getByTestId('store-logo') as HTMLImageElement;
    // if className exist, assert
    className && expect(imageElement).toHaveClass(className);
  });

  // Test if the component has the same testID pass on props
  it('Should have the same testID pass on props', () => {
    const divElement = screen.getByTestId(testID) as HTMLDivElement;
    expect(divElement).toBeInTheDocument();
  });

  // Test if the component has the same src pass on props
  it('Should have the same src pass on props', () => {
    const imageElement = screen.getByTitle(title) as HTMLImageElement;
    // length determines if found the same src path
    // if length is 1 therefore didn't find any src path base on splitting
    const IdentifierLength = 1;
    expect(imageElement.src.split(src)).not.toHaveLength(IdentifierLength);
  });

  // Test if the component has the same alt pass on props
  it('Should have the same alt pass on props', () => {
    const imageElement = screen.getByTitle(title) as HTMLImageElement;
    expect(imageElement.alt).toBe(alt);
  });

  // Test if the component has the same title pass on props
  it('Should have the same title pass on props', () => {
    const imageElement = screen.getByTitle(title) as HTMLImageElement;
    expect(imageElement.title).toBe(title);
  });
});

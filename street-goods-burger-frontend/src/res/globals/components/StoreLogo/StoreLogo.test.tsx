import { render, screen } from '@testing-library/react';

import StoreLogo from './StoreLogo';

interface StoreLogoProps {
  className: string;
  ['data-testid']: string;
}

describe('StoreLogo', () => {
  const props: StoreLogoProps = {
    className: 'store-logo',
    ['data-testid']: 'store-logo'
  };

  beforeEach(() => {
    render(<StoreLogo {...props} />);
  });

  const { className, ['data-testid']: testID } = props;

  // Test if the component has the same className pass on props
  it('Should have the same classname pass on props', () => {
    const svgElement = screen.getByTestId('store-logo') as HTMLOrSVGElement;
    expect(svgElement).toHaveClass(className);
  });

  // Test if the component has the same role pass on props
  it('Should have the same classname pass on props', () => {
    const svgElement = screen.getByTestId(testID) as HTMLOrSVGElement;
    expect(svgElement).toBeInTheDocument();
  });
});

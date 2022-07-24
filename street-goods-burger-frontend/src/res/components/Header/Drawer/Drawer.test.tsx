import { render, screen } from '@testing-library/react';

import Drawer from './Drawer';
import { DrawerProps } from './utils';

describe('Drawer', () => {
  const props: DrawerProps = {
    className: 'drawer',
    onClick: jest.fn(),
    open: true,
    ['data-testid']: 'drawer'
  };

  const { className, ['data-testid']: testID } = props;

  beforeEach(() => {
    render(<Drawer {...props} />);
  });

  // Test if have the className--open when open is true
  it(`should have class ${className}--open when open is true`, () => {
    if (testID != null && className != null) {
      const svgElement = screen.getByTestId(testID) as HTMLOrSVGScriptElement;

      expect(svgElement).toHaveClass(`${className}--open`);
    }
  });

  // Test if has the same className pass on props
  it(`should have the same className pass on props`, () => {
    if (testID != null && className != null) {
      const svgElement = screen.getByTestId(testID) as HTMLOrSVGScriptElement;
      expect(svgElement).toHaveClass(className);
    }
  });
});

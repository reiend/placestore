import React from 'react';
import { render, screen } from '@testing-library/react';
import StoreLogo from './index.ts';

interface StoreLogoProps {
  className: string;
  role: string;
  onClick?: () => void;
}

describe('StoreLogo', () => {
  const props: StoreLogoProps = {
    className: 'store-logo',
    role: 'store-logo',
  };
  beforeEach(() => {
    render(<StoreLogo {...props} />);
  });

  const { className, role } = props;

  // Test if the component renders without crashing
  it('Should renders without crashing', () => {});

  // Test if the component has the same className pass on props
  it('Should have the same classname pass on props', () => {
    const svgElement = screen.getByRole('store-logo') as HTMLOrSVGElement;
    expect(svgElement).toHaveClass(className);
  });

  // Test if the component has the same role pass on props
  it('Should have the same classname pass on props', () => {
    const svgElement = screen.getByRole(role) as HTMLOrSVGElement;
    expect(svgElement).toBeInTheDocument();
  });
});

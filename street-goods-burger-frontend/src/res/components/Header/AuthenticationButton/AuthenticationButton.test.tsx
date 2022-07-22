import React from 'react';
import { render, screen } from '@testing-library/react';
import AuthenticationButton from './index.ts';

interface AuthenticationButtonProps {
  title: string;
  role: string;
}

describe('AuthenticationButton', () => {
  const props: AuthenticationButtonProps = {
    title: 'signup-button',
    role: 'signup-button',
  };

  beforeEach(() => {
    render(<AuthenticationButton {...props} />);
  });

  const { title, role } = props;

  // Test if the component renders without crashing
  it('Should renders without crashing', () => {});

  // Test if the component has the same title pass on props
  it('Should have the same title pass on props', () => {
    const buttonElement = screen.getByText(title) as HTMLButtonElement;
    expect(buttonElement).toBeInTheDocument();
  });

  // Test if the component has the same role pass on props
  it('Should have the same role pass on props', () => {
    const buttonElement = screen.getByRole(role) as HTMLButtonElement;
    expect(buttonElement).toBeInTheDocument();
  });
});

import { render, screen } from '@testing-library/react';
import AuthenticationButton from './AuthenticationButton';

import { AuthenticationButtonProps } from './utils';

describe('AuthenticationButton', () => {
  const props: AuthenticationButtonProps = {
    title: 'signup-button'
  };

  beforeEach(() => {
    render(<AuthenticationButton {...props} />);
  });

  const { title } = props;

  // Test if the component has the same title pass on props
  it('Should have the same title pass on props', () => {
    const buttonElement = screen.getByText(title) as HTMLButtonElement;
    expect(buttonElement).toBeInTheDocument();
  });
});

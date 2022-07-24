import { render, screen } from '@testing-library/react';
import AuthenticationButton from './AuthenticationButton';

import { AuthenticationButtonProps } from './utils';

describe('AuthenticationButton', () => {
  const props: AuthenticationButtonProps = {
    title: 'signup-button',
    className: 'signup-button'
  };

  beforeEach(() => {
    render(<AuthenticationButton {...props} />);
  });

  const { className, title } = props;

  // Test if the component has the same className pass on props
  it('Should have the same className pass on props', () => {
    // removes null and undefined
    if (className != null) {
      const buttonElement = screen.getByText(className) as HTMLButtonElement;
      expect(buttonElement).toBeInTheDocument();
    }
  });

  // Test if the component has the same title pass on props
  it('Should have the same title pass on props', () => {
    const buttonElement = screen.getByText(title) as HTMLButtonElement;
    expect(buttonElement).toBeInTheDocument();
  });
});

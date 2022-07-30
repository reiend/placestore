import { render, screen, fireEvent } from '@testing-library/react';
import { act } from 'react-dom/test-utils';

import Signup from './Signup';

describe('Signup', () => {
  const component = <Signup onSubmit={jest.fn()} buttonText={'signup'} />;
  // Test if the component has a form
  it('Should have a form', () => {
    render(component);
    const formElement = screen.getByTestId('signup') as HTMLFormElement;
    expect(formElement).toBeInTheDocument();
  });

  // Test if the when the form submits without email and password show error messages
  it('Should show error messsage when form submit empty either email or password', async () => {
    render(component);

    const formElement = screen.getByTestId('signup') as HTMLButtonElement;

    await act(async () => {
      fireEvent.submit(formElement);
    });

    expect(screen.getByText('please provide an email')).toBeInTheDocument();
    expect(
      screen.getByText('password must be at least 6 characters')
    ).toBeInTheDocument();
    expect(
      screen.getByText('please provide a password confirmation')
    ).toBeInTheDocument();
  });

  // Test if the component prop button text has the same value pass on buttonText prop
  it('Should have the same button text pass on prop', () => {
    render(component);
    const buttonElement = screen.getByRole('button', {
      name: 'signup'
    }) as HTMLButtonElement;

    expect(buttonElement).toBeInTheDocument();
  });

  // Test if the component have an email input
  it('Should have a email input', () => {
    render(component);

    const inputElement = screen.getByPlaceholderText(
      'email'
    ) as HTMLInputElement;
    expect(inputElement).toBeInTheDocument();
  });

  // Test if the component have an password input
  it('Should have a password input', () => {
    render(component);

    const inputElement = screen.getByPlaceholderText(
      'password'
    ) as HTMLInputElement;
    expect(inputElement).toBeInTheDocument();
  });

  // Test if the component have an password confirmation input
  it('Should have a password confirmation input', () => {
    render(component);

    const inputElement = screen.getByPlaceholderText(
      'password confirmation'
    ) as HTMLInputElement;
    expect(inputElement).toBeInTheDocument();
  });
});

import { render, screen, fireEvent } from '@testing-library/react';
import { act } from 'react-dom/test-utils';

import Signin from './Signin';

describe('Signin', () => {
  const component = <Signin onSubmit={jest.fn()} buttonText={'signin'} />;
  // Test if the component has a form
  it('Should have a form', () => {
    render(component);
    const formElement = screen.getByTestId('signin') as HTMLFormElement;
    expect(formElement).toBeInTheDocument();
  });

  // Test if the when the form submits without email and password show error messages
  it('Should show error messsage when form submit empty either email or password', async () => {
    render(component);

    const formElement = screen.getByTestId('signin') as HTMLButtonElement;

    await act(async () => {
      fireEvent.submit(formElement);
    });

    expect(screen.getByText('please provide an email')).toBeInTheDocument();
    expect(screen.getByText('please provide a password')).toBeInTheDocument();
  });

  // Test if the component prop button text has the same value pass on buttonText prop
  it('Should have the same button text pass on prop', () => {
    render(component);

    const buttonElement = screen.getByRole('button', {
      name: 'signin'
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
});

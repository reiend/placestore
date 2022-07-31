import { render, screen, fireEvent } from '@testing-library/react';
import { act } from 'react-dom/test-utils';

import FormStore from './FormStore';

describe('FormStore', () => {
  const component = <FormStore onSubmit={jest.fn()} buttonText={'create'} />;
  // Test if the component has a form
  it('Should have a form', () => {
    render(component);
    const formElement = screen.getByTestId('form-store') as HTMLFormElement;
    expect(formElement).toBeInTheDocument();
  });

  // Test if the when the form submits without email and password show error messages
  it('Should show error messsage when form submit empty either email or password', async () => {
    render(component);

    const formElement = screen.getByTestId('form-store') as HTMLButtonElement;

    await act(async () => {
      fireEvent.submit(formElement);
    });

    expect(screen.getByText('please provide a name')).toBeInTheDocument();
    expect(screen.getByText('please provide a line1')).toBeInTheDocument();
    expect(screen.getByText('please provide a line2')).toBeInTheDocument();
    expect(
      screen.getByText('please provide a postal code')
    ).toBeInTheDocument();
    expect(screen.getByText('please provide a city')).toBeInTheDocument();
    expect(screen.getByText('please provide a province')).toBeInTheDocument();
  });

  // Test if the component prop button text has the same value pass on buttonText prop
  it('Should have the same button text pass on prop', () => {
    render(component);

    const buttonElement = screen.getByRole('button', {
      name: 'create'
    }) as HTMLButtonElement;

    expect(buttonElement).toBeInTheDocument();
  });

  // Test if the component have an name input
  it('Should have a name input', () => {
    render(component);

    const inputElement = screen.getByPlaceholderText(
      'name'
    ) as HTMLInputElement;
    expect(inputElement).toBeInTheDocument();
  });

  // Test if the component have an line1 input
  it('Should have a line1 input', () => {
    render(component);

    const inputElement = screen.getByPlaceholderText(
      'line 1'
    ) as HTMLInputElement;
    expect(inputElement).toBeInTheDocument();
  });

  // Test if the component have an line2 input
  it('Should have a line2 input', () => {
    render(component);

    const inputElement = screen.getByPlaceholderText(
      'line 2'
    ) as HTMLInputElement;
    expect(inputElement).toBeInTheDocument();
  });

  // Test if the component have an postal code input
  it('Should have a postal code input', () => {
    render(component);

    const inputElement = screen.getByPlaceholderText(
      'postal code'
    ) as HTMLInputElement;
    expect(inputElement).toBeInTheDocument();
  });

  // Test if the component have an city input
  it('Should have a city input', () => {
    render(component);

    const inputElement = screen.getByPlaceholderText(
      'city'
    ) as HTMLInputElement;
    expect(inputElement).toBeInTheDocument();
  });

  // Test if the component have an province input
  it('Should have a province input', () => {
    render(component);

    const inputElement = screen.getByPlaceholderText(
      'province'
    ) as HTMLInputElement;
    expect(inputElement).toBeInTheDocument();
  });
});

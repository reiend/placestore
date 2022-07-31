import { render, screen, fireEvent } from '@testing-library/react';
import { act } from 'react-dom/test-utils';

import FormFood from './FormFood';

describe('FormStore', () => {
  const component = <FormFood onSubmit={jest.fn()} buttonText={'create'} />;
  // Test if the component has a form
  it('Should have a form', () => {
    render(component);
    const formElement = screen.getByTestId('form-food') as HTMLFormElement;
    expect(formElement).toBeInTheDocument();
  });

  // Test if the form shows error when submit without name, category, description, price
  it('Should show error messsage when form submit empty inputs ', async () => {
    render(component);

    const formElement = screen.getByTestId('form-food') as HTMLButtonElement;

    await act(async () => {
      fireEvent.submit(formElement);
    });

    expect(screen.getByText('please provide a name')).toBeInTheDocument();
    expect(screen.getByText('please provide a category')).toBeInTheDocument();
    expect(
      screen.getByText('please provide a description')
    ).toBeInTheDocument();
    expect(
      screen.getByText('please provide a valid price')
    ).toBeInTheDocument();
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

  // Test if the component have an category input
  it('Should have a category input', () => {
    render(component);

    const inputElement = screen.getByPlaceholderText(
      'category'
    ) as HTMLInputElement;
    expect(inputElement).toBeInTheDocument();
  });

  // Test if the component have an description input
  it('Should have a description input', () => {
    render(component);

    const inputElement = screen.getByPlaceholderText(
      'description'
    ) as HTMLInputElement;
    expect(inputElement).toBeInTheDocument();
  });

  // Test if the component have a price input
  it('Should have a price code input', () => {
    render(component);

    const inputElement = screen.getByPlaceholderText(
      'price in PHP'
    ) as HTMLInputElement;
    expect(inputElement).toBeInTheDocument();
  });
});

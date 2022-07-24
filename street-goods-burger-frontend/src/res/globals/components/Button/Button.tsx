import PropTypes from 'prop-types';

import { ButtonProps } from './utils';

import './Button.scss';

const Button = ({ title, ...props }: ButtonProps) => {
  return <button {...props}>{title}</button>;
};

Button.propTypes = {
  title: PropTypes.string.isRequired
};

export default Button;

import PropTypes from 'prop-types';

import { AuthenticationButtonProps } from './utils';

import './AuthenticationButton.scss';

const AuthenticationButton = ({
  title,
  ...props
}: AuthenticationButtonProps) => {
  return <button {...props}>{title}</button>;
};

AuthenticationButton.propTypes = {
  title: PropTypes.string.isRequired
};

export default AuthenticationButton;

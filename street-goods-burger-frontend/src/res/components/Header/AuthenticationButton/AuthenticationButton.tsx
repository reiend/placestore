import React from 'react';
import PropTypes from 'prop-types';

import './AuthenticationButton.scss';

interface AuthenticationButtonProps {
  title: string;
}

const AuthenticationButton = ({ title }: AuthenticationButtonProps) => {
  return <button>{title}</button>;
};

AuthenticationButton.propTypes = {
  title: PropTypes.string.isRequired
};

export default AuthenticationButton;

import React from 'react';
import PropTypes from 'prop-types';

import './AuthenticationButton.scss';

interface AuthenticationButtonProps {
  title: string;
  role: string;
}

const AuthenticationButton = ({ role, title }: AuthenticationButtonProps) => {
  return <button role={role}>{title}</button>;
};

AuthenticationButton.propTypes = {
  title: PropTypes.string.isRequired,
  role: PropTypes.string.isRequired,
};

export default AuthenticationButton;

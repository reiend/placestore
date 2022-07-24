import React from 'react';
import PropTypes from 'prop-types';

import { AuthenticationButtonProps } from './utils';

import './AuthenticationButton.scss';

const AuthenticationButton = ({ title }: AuthenticationButtonProps) => {
  return <button>{title}</button>;
};

AuthenticationButton.propTypes = {
  title: PropTypes.string.isRequired
};

export default AuthenticationButton;

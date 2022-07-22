import React from 'react';
import PropType from 'prop-types';

import './AuthenticationButton.scss';

interface AuthenticationButtonProps {
  title: string;
  role: string;
}

const AuthenticationButton: React.FC<AuthenticationButtonProps> = ({
  title,
  role,
}) => {
  return <button role={role}>{title}</button>;
};

AuthenticationButton.prototype = {
  title: PropType.string,
  role: PropType.string,
};

export default AuthenticationButton;

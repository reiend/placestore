import PropTypes from 'prop-types';

import { DrawerProps } from './utils';

import './Drawer.scss';

const Drawer = ({ className, open, ...props }: DrawerProps) => {
  return (
    <svg
      className={!open ? `${className}` : `${className} ${className}--open`}
      {...props}
      role='button'
      viewBox='0 0 32 32'
      fill='none'
      xmlns='http://www.w3.org/2000/svg'
    >
      <path d='M5 16H27' />
      <path d='M5 8H27' />
      <path d='M5 24H27' />
    </svg>
  );
};

Drawer.propTypes = {
  className: PropTypes.string,
  open: PropTypes.bool,
  onClick: PropTypes.func,
  ['data-testid']: PropTypes.string
};

export default Drawer;

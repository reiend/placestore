import Proptypes from 'prop-types';

import { NavbarProps } from './utils';
import uniqueID from '@libs/reiend/js/unique';

import './Navbar.scss';

const Navbar = ({ items, ...props }: NavbarProps) => {
  const getUniqueKey = (params: { letters: number; numbers: number }) =>
    uniqueID({ ...params });

  const list = items.map(item => {
    const id = getUniqueKey({ letters: 5, numbers: 5 });
    return (
      <li key={id} id={id}>
        <a href={`#${item}`}>{item}</a>
      </li>
    );
  });

  return (
    <nav {...props}>
      <ul>{list}</ul>
    </nav>
  );
};

Navbar.propTypes = {
  className: Proptypes.string,
  items: Proptypes.array.isRequired
};

export default Navbar;

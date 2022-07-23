import uniqueID from '@libs/reiend/js/unique';

import './Navbar.scss';

interface NavbarProps {
  items: readonly [string, string, string, string];
}

const Navbar = ({ items }: NavbarProps) => {
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
    <nav>
      <ul>{list}</ul>
    </nav>
  );
};

export default Navbar;

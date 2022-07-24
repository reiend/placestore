import Proptypes from 'prop-types';

import Navbar from '../Navbar';
import Button from '../../../globals/components/Button'; // for some reason using alias here remove types checking
import { DrawerContentProps } from './utils';

import './DrawerContent.scss';

const DrawerContent = ({ className, ...props }: DrawerContentProps) => {
  return (
    <div className={className} {...props}>
      <Navbar
        className={`${className}__navbar`}
        items={['home', 'menu', 'about', 'contacts']}
      />

      <Button className={`${className}__signin`} title='signin' />
      <Button className={`${className}__signup`} title='signup' />
    </div>
  );
};

DrawerContent.propTypes = {
  className: Proptypes.string,
  ['data-testid']: Proptypes.string
};

export default DrawerContent;

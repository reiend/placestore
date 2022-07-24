import PropTypes from 'prop-types';

import { BrandProps } from './utils';

import './Brand.scss';

const Brand = ({ src, alt, title, ...props }: BrandProps) => {
  return (
    <div {...props}>
      <img src={src} alt={alt} title={title} />
    </div>
  );
};

Brand.propTypes = {
  className: PropTypes.string,
  src: PropTypes.string.isRequired,
  alt: PropTypes.string.isRequired,
  title: PropTypes.string.isRequired,
  ['data-testid']: PropTypes.string
};

export default Brand;

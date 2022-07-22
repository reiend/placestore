import React from 'react';
import PropTypes from 'prop-types';

import './StoreLogo.scss';

interface StoreLogo {
  className?: string;
  role: string;
}

const StoreLogo = (props: StoreLogo) => {
  return (
    <div>
      <svg
        {...props}
        viewBox='0 0 151 151'
        fill='none'
        xmlns='http://www.w3.org/2000/svg'
      >
        {' '}
        <g filter='url(#filter0_d_240_758)'>
          <circle cx='75.5' cy='71.5' r='71.5' fill='#FFEEE2' />
          <path
            d='M98.9336 28.5399C98.9336 23.3965 103.103 19.2269 108.247 19.2269V19.2269C113.39 19.2269 117.56 23.3965 117.56 28.54V128.58H98.9336V28.5399Z'
            fill='#C78657'
          />
          <rect
            x='88.8936'
            y='27.3114'
            width='4.61979'
            height='37.7366'
            rx='2.3099'
            transform='rotate(-90 88.8936 27.3114)'
            fill='#C78657'
          />
          <rect
            x='90.0371'
            y='42.326'
            width='3.46484'
            height='37.7366'
            rx='1.73242'
            transform='rotate(-90 90.0371 42.326)'
            fill='#C78657'
          />
          <rect
            x='16.0176'
            y='34.2479'
            width='3.60504'
            height='111.756'
            rx='1.80252'
            transform='rotate(-90 16.0176 34.2479)'
            fill='#C78657'
          />
          <rect
            x='56.874'
            y='34.2415'
            width='8.00472'
            height='23.099'
            fill='#C78657'
          />
          <path
            d='M93.5378 73.4917C93.5378 82.412 78.1627 81.883 59.1966 81.883C40.2305 81.883 24.8555 82.412 24.8555 73.4917C24.8555 64.5713 40.2305 57.34 59.1966 57.34C78.1627 57.34 93.5378 64.5713 93.5378 73.4917Z'
            fill='#E88668'
          />
          <path
            d='M25.929 101.794C25.929 96.6971 41.3041 96.9994 60.2702 96.9994C79.2363 96.9994 94.6113 96.6971 94.6113 101.794C94.6113 106.892 79.2363 112.777 60.2702 112.777C41.3041 112.777 25.929 106.892 25.929 101.794Z'
            fill='#E88668'
          />
          <ellipse
            cx='60.1359'
            cy='65.2981'
            rx='3.35363'
            ry='3.37211'
            fill='white'
          />
          <ellipse
            cx='74.8917'
            cy='68.5354'
            rx='3.35363'
            ry='3.37211'
            fill='white'
          />
          <ellipse
            cx='45.38'
            cy='68.5354'
            rx='3.35363'
            ry='3.37211'
            fill='white'
          />
          <rect
            x='28.8799'
            y='84.0471'
            width='62.7799'
            height='9.71169'
            rx='4.85584'
            fill='#E45151'
          />
        </g>
        <defs>
          <filter
            id='filter0_d_240_758'
            x='0'
            y='0'
            width='151'
            height='151'
            filterUnits='userSpaceOnUse'
            colorInterpolationFilters='sRGB'
          >
            <feFlood floodOpacity='0' result='BackgroundImageFix' />
            <feColorMatrix
              in='SourceAlpha'
              type='matrix'
              values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0'
              result='hardAlpha'
            />
            <feOffset dy='4' />
            <feGaussianBlur stdDeviation='2' />
            <feComposite in2='hardAlpha' operator='out' />
            <feColorMatrix
              type='matrix'
              values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0'
            />
            <feBlend
              mode='normal'
              in2='BackgroundImageFix'
              result='effect1_dropShadow_240_758'
            />
            <feBlend
              mode='normal'
              in='SourceGraphic'
              in2='effect1_dropShadow_240_758'
              result='shape'
            />
          </filter>
        </defs>
      </svg>
    </div>
  );
};

StoreLogo.propTypes = {
  className: PropTypes.string,
  role: PropTypes.string.isRequired,
};

export default StoreLogo;

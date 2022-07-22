import React from 'react';
import ReactDOM from 'react-dom';
import App from '@components/App/index.ts';
import Element from '@libs/reiend/js/element.js';

const app = Element().createElement('div').init();
Element().queryElement('body').appendChild(app);

ReactDOM.render(<App />, app);

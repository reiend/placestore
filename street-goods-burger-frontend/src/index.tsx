import { createRoot } from 'react-dom/client';
import App from '@components/App/index.ts';

const divElement = document.getElementById('root') as HTMLDivElement;

const root = createRoot(divElement);
const test = 'qrq';

root.render(<App />);

// this enabled hot reload
if (module.hot) {
  module.hot.accept();
}

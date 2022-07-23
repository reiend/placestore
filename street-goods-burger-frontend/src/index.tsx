import { createRoot } from 'react-dom/client';
import App from '@components/App';

const divElement = document.getElementById('root') as HTMLDivElement;

const root = createRoot(divElement);

root.render(<App />);

// this enabled hot reload
if (module.hot) {
  module.hot.accept();
}

/// <reference types="vite/client" />

declare module '*.png';
declare module '*.svg';
declare module '*.jpeg';
declare module '*.jpg';

interface ImportMetaEnv {
  VITE_BASE_URL: string;
}

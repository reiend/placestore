// this will removed linting error when doing an import for missing declaration

declare module '*.jpeg' {
  const content: any;
  export default content;
}

declare module '*.png' {
  const content: any;
  export default content;
}

declare module '*.jpg' {
  const content: any;
  export default content;
}

declare module '*.tsx' {
  const content: any;
  export default content;
}

declare module '*.js' {
  const content: any;
  export default content;
}

declare module '*.ts' {
  const content: any;
  export default content;
}

// aliases
declare module '@components/*' {
  const content: any;
  export default content;
}

declare module '@schemas/*' {
  const content: any;
  export default content;
}

declare module '@globals/*' {
  const content: any;
  export default content;
}

declare module '@libs/*' {
  const content: any;
  export default content;
}

declare module '@assets/*' {
  const content: any;
  export default content;
}

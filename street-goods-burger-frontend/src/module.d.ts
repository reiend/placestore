// this will removed Tsserver linting error when doing an import

declare module '*.jpeg' {
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

import { build } from "esbuild";

build({
  entryPoints: ["./src/index.tsx"],
  outfile: "./public/bundle.js",
  bundle: true,
  target: "es6",
  sourcemap: true,
  loader: { ".ts": "ts" },
  watch: true,
}).catch((error) => {
  console.error(error);
  process.exit(1);
});

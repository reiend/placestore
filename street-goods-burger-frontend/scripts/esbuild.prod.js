import { build } from "esbuild";

build({
  entryPoints: ["./src/index.tsx"],
  outfile: "./public/bundle.js",
  target: "es6",
  bundle: true,
  minify: true,
  loader: { ".ts": "ts" },
  sourcemap: true,
});

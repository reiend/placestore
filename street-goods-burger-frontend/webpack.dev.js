const path = require('path'); /* node path */
const glob = require('glob');
const HtmlWebpackPlugin = require('html-webpack-plugin'); /* for loading / create html */
const MinicssExtractPlugin = require('mini-css-extract-plugin'); /* extracting css from js*/
const PurgecssPlugin = require('purgecss-webpack-plugin'); /* for cleaning unused style */
const tailwindcss = require('tailwindcss');

const ROOT_PATH = {
  src: path.resolve(__dirname, `src`),
};

module.exports = {
  mode: 'development',
  entry: './src/index.tsx',
  output: {
    filename: '[name][contenthash].bundle.js',
    path: path.resolve(__dirname, './dist'),
    clean: true,
  },

  resolve: {
    // for shorten imports
    alias: {
      // default root component
      '@components': `${ROOT_PATH.src}/res/components`,

      // src
      '@src': `${ROOT_PATH.src}`,

      // libs
      '@libs': `${ROOT_PATH.src}/libs`,

      // globals
      '@globals': `${ROOT_PATH.src}/res/globals`,

      // globals
      '@styles': `${ROOT_PATH.src}/res/styles`,

      // globals
      '@assets': `${ROOT_PATH.src}/../public/assets`,

      // resolve naming conflicts using its file extention
      extensions: ['.ts', '.tsx', '.js', '.jsx'],
    },
  },

  module: {
    rules: [
      // load css
      {
        // sass or scss
        test: /\.s[ac]ss$/i,
        use: [
          MinicssExtractPlugin.loader,
          'css-loader',
          {
            loader: 'postcss-loader',
            options: {
              postcssOptions: {
                plugins: [[tailwindcss, 'postcss-preset-env', 'autoprefixer']],
              },
            },
          },
          'sass-loader',
        ],
      },
      {
        test: /\.m?(ts|tsx)$/,
        loader: 'esbuild-loader',
        options: {
          loader: 'tsx', // Remove this if you're not using JSX
          target: 'es2015', // Syntax to compile to (see options below for possible values)
        },
      },

      // {
      //   // transpiler
      //   test: /\.m?(js|jsx)$/,
      //   exclude: /(node_modules|bower_components)/,
      //   use: {
      //     loader: "babel-loader",
      //     options: {
      //       presets: ["@babel/preset-env", "@babel/preset-react"],
      //       targets: { esmodules: true },
      //     },
      //   },
      // },
      //  pulling assets
      {
        test: /\.(png|svg|jpg|jpeg|gif|jfif)$/i,
        type: 'asset/resource',
      },

      // pulling fonts
      {
        test: /\.(woff|woff2|eot|ttf|otf)$/i,
        type: 'asset/resource',
      },
    ],
  },

  plugins: [
    // create root html
    new HtmlWebpackPlugin({
      title: 'title here',
      filename: 'index.html',
    }),
    // new Dotenv(),
    // css extractor from js
    new MinicssExtractPlugin({
      filename: '[name].bundle.css',
    }),
    // unused style clean up
    new PurgecssPlugin({
      paths: glob.sync(`${ROOT_PATH.src}/**/*`, { nodir: true }),
      defaultExtractor: content =>
        content.match(/[/@/:\w-/:/-/>]+(?<!:)/g) || [],
    }),
  ],

  devServer: {
    static: {
      directory: path.join(__dirname, 'dist'),
    },
    open: true,
    hot: true,
    compress: true,
    port: 9002,
  },
};

// npx tsc --nit --rootDir src --jsx react

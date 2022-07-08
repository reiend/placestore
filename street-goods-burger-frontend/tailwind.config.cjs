const plugin = require("tailwindcss/plugin");


/** @type {import('tailwindcss').Config} */
module.exports = {
  plugins: [
    plugin(function ({ addUtilities }) {
      addUtilities({
        // dark variant
        ".bg-valentine-d-50": {
          "background-color": "#d24b4b",
        },
        ".bg-valentine-d-100": {
          "background-color": "#c04444",
        },
        ".bg-valentine-d-200": {
          "background-color": "#ad3e3e",
        },
        ".bg-valentine-d-300": {
          "background-color": "#9b3737",
        },
        ".bg-valentine-d-400": {
          "background-color": "#893131",
        },
        ".bg-valentine-d-500": {
          "background-color": "#772a2a",
        },
        ".bg-valentine-d-600": {
          "background-color": "#642424",
        },
        ".bg-valentine-d-700": {
          "background-color": "#521d1d",
        },
        ".bg-valentine-d-800": {
          "background-color": "#401717",
        },
        ".bg-valentine-d-900": {
          "background-color": "#2e1010",
        },


        ".bg-copper-d-50": {
          "background-color": "#d57c60",
        },
        ".bg-copper-d-100": {
          "background-color": "#c37157",
        },
        ".bg-copper-d-200": {
          "background-color": "#b0674f",
        },
        ".bg-copper-d-300": {
          "background-color": "#9e5c47",
        },
        ".bg-copper-d-400": {
          "background-color": "#8b513e",
        },
        ".bg-copper-d-500": {
          "background-color": "#794636",
        },
        ".bg-copper-d-600": {
          "background-color": "#663b2e",
        },
        ".bg-copper-d-700": {
          "background-color": "#543125",
        },
        ".bg-copper-d-800": {
          "background-color": "#41261d",
        },
        ".bg-copper-d-900": {
          "background-color": "#2e1b15",
        },


        // light variant

        ".bg-valentine-l-50": {
          "background-color": "#e65f5f",
        },
        ".bg-valentine-l-100": {
          "background-color": "#e86d6d",
        },
        ".bg-valentine-l-200": {
          "background-color": "#ea7b7b",
        },
        ".bg-valentine-l-300": {
          "background-color": "#ed8989",
        },
        ".bg-valentine-l-400": {
          "background-color": "#ef9797",
        },
        ".bg-valentine-l-500": {
          "background-color": "#f1a5a5",
        },
        ".bg-valentine-l-600": {
          "background-color": "#f3b2b2",
        },
        ".bg-valentine-l-700": {
          "background-color": "#f5c0c0",
        },
        ".bg-valentine-l-800": {
          "background-color": "#f7cece",
        },
        ".bg-valentine-l-900": {
          "background-color": "#fadcdc",
        },


        ".bg-valentine-l-50": {
          "background-color": "#e65f5f",
        },
        ".bg-valentine-l-100": {
          "background-color": "#e86d6d",
        },
        ".bg-valentine-l-200": {
          "background-color": "#ea7b7b",
        },
        ".bg-valentine-l-300": {
          "background-color": "#ed8989",
        },
        ".bg-valentine-l-400": {
          "background-color": "#ef9797",
        },
        ".bg-valentine-l-500": {
          "background-color": "#f1a5a5",
        },
        ".bg-valentine-l-600": {
          "background-color": "#f3b2b2",
        },
        ".bg-valentine-l-700": {
          "background-color": "#f5c0c0",
        },
        ".bg-valentine-l-800": {
          "background-color": "#f7cece",
        },
        ".bg-valentine-l-900": {
          "background-color": "#fadcdc",
        },

        ".bg-copper-l-50": {
          "background-color": "#ea9174",
        },
        ".bg-copper-l-100": {
          "background-color": "#ec9a80",
        },
        ".bg-copper-l-200": {
          "background-color": "#eea48c",
        },
        ".bg-copper-l-300": {
          "background-color": "#efad98",
        },
        ".bg-copper-l-400": {
          "background-color": "#f1b7a4",
        },
        ".bg-copper-l-500": {
          "background-color": "#f3c1b0",
        },
        ".bg-copper-l-600": {
          "background-color": "#f5cabd",
        },
        ".bg-copper-l-700": {
          "background-color": "#f7d4c9",
        },
        ".bg-copper-l-800": {
          "background-color": "#f9ddd5",
        },
        ".bg-copper-l-900": {
          "background-color": "#f0dad3",
        },

      });
    }),
  ],
  content: ["./src/**/*.{html,tsx,ts,jsx,js}"],
  theme: {
    extend: {},
  },
};


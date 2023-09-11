/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./dist/*.{html,xsl,js}"],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        'ifz-dark-blue': '#5385cc',
        'ifz-medium-blue': '#67adf2',
        'ifz-light-blue': '#b8d1d7',
        'ifz-grey': '#b8d1d6',
        'ifz-light-grey': '#cccccc',
      },
      width: {
        '3/24': '12.5%',
      },
    },
  },
  plugins: [],
}

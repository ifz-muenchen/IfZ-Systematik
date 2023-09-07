/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./dist/*.{html,xsl,js}"],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        'ifz-dark-blue': '#0075be',
        'ifz-light-blue': '#bfdbfe',
      },
      width: {
        '3/24': '12.5%',
      },
    },
  },
  plugins: [],
}

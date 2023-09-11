/** @type {import('tailwindcss').Config} */
export const content = ['./dist/*.{html,xsl,js}'];
export const darkMode = 'class';
export const theme = {
  extend: {
    colors: {
      /** Main Colors */
      'ifz-dark-blue': '#5385cc',
      'ifz-medium-blue': '#67adf2',
      'ifz-light-blue': '#b8d1d7',
      'ifz-light-gray': '#cccccc',

      /** Darkmode Colors */
      'ifz-darkmode-background': '#1F324D',
      'ifz-darkmode-table-border': '#1F324D',
      'ifz-darkmode-table-hover': '#4B5563',
      'ifz-darkmode-table-background': '#001b2e',

      /** Lightmode Colors */
      'ifz-lightmode-background': '#FBFBFF',
      'ifz-lightmode-table-border': '#FBFBFF',
      'ifz-lightmode-table-hover': '#CDD8E8',
      'ifz-lightmode-table-background': '#f4f4f8',

      /** Text Colors */
      'ifz-text-white': '#FFFFFF',
      'ifz-text-light-gray': '#9CA3AF',
      'ifz-text-dark-gray': '#4B5563',
      'ifz-text-dark': '#374151',
      'ifz-text-black': '#111827',
    },
    width: {
      '3/24': '12.5%',
    },
  },
};
export const plugins = [];

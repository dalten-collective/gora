module.exports = {
  prefix: 'tw-',
  corePlugins: {
    preflight: false,
  },
  content: ['index.html','./src/**/*.{js,jsx,ts,tsx,vue,html}'],
  theme: {
    extend: {
      colors: {
        white: '#ffffff',
        background: '#ffffff',
        surface: '#f0efef',
        primary: '#393939',
        // primary: '#3b82f6',
        'primary-darken-1': '#4c4842',
        secondary: '#c6c6c5',
        'secondary-darken-1': '#bcb1a1',
        success: '#4bbb81',
        info: '#338694',
        error: '#E11D48',
        warning: '#FBBF24',
      },
      textColor: {
        DEFAULT: '#3b82f6',
        black: '#3b82f6',
      },
      fontFamily: {
        silom: ["silom"],
        sans: ['silom'],
      },
      borderRadius: {
        DEFAULT: '2.5px',
        'gora': '2.5px',
      },
      borderWidth: {
        DEFAULT: '1.33px',
        'gora': '1.33px',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}

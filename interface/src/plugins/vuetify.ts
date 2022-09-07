// Styles
import '@mdi/font/css/materialdesignicons.css'
import 'vuetify/styles'

// Vuetify
import { createVuetify, ThemeDefinition } from 'vuetify'

// import Pusvg from "../components/Pusvg.vue"

import theme from '../theme'

const goraTheme: ThemeDefinition = {
  dark: false,
  colors: {
    background: theme.white,
    // surface: '#f0efef',
    surface: theme.secondaryGray,
    primary: theme.darkTextColor,
    // primary: '#3b82f6',
    'primary-darken-1': '#4c4842',
    // secondary: '#c6c6c5',
    secondary: theme.secondaryGray,
    'secondary-darken-1': '#bcb1a1',
    // success: '#10B981',
    success: theme.actionColor,
    info: theme.accentColor,
    error: '#E11D48',
    warning: '#FBBF24',
    'on-background': theme.darkTextColor,
    'on-surface': theme.darkTextColor,
    'on-primary': 'white',
    'on-secondary': theme.darkTextColor,
    'on-success': 'white',
    'on-warning': 'white',
    'on-error': 'white',
    'on-info': 'white',

  },
}

export default createVuetify({
  // https://vuetifyjs.com/en/introduction/why-vuetify/#feature-guides
  // icons: {
  //   'pus': {
  //     component: Pusvg,
  //     props: {
  //       name: 'pus'
  //     },
  //   },
  // },
  theme: {
    defaultTheme: 'goraTheme',
    themes: {
      goraTheme
    }
  }
})


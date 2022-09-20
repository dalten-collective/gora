<template>
  <v-btn :color="color" icon variant="outlined" >
    <img :src="img" height="30" width="30" />
  </v-btn>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  props: {
    color: {
      type: String,
      default: ''
    },
    img: {
      type: String,
      default: ''
    }
  },
})
</script>


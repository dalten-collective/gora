<template>
  <v-btn elevation="20" :color="color" icon :loading="loading" :disabled="disabled">
    <img :src="iconToComponent" height="35" width="35" />
    <v-tooltip v-if="hint" activator="parent" location="bottom">
      {{ hint }}
    </v-tooltip>
  </v-btn>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

import acceptOffer from "@/assets/icons/offer.png";
import rejectOffer from "@/assets/icons/reject.png";

export default defineComponent({
  props: {
    whichIcon: {
      type: String,
      default: 'acceptOffer'
    },
    color: {
      type: String,
      default: ''
    },
    img: {
      type: String,
      default: ''
    },
    hint: {
      type: String,
      default: ''
    },
    loading: {
      type: Boolean,
      default: false,
    },
    disabled: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      acceptOffer,
      rejectOffer,
    }
  },

  computed: {
    iconToComponent() {
      return this[this.whichIcon]
    }
  },
})
</script>


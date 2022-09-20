<template>
    <v-btn :color="color" icon :loading="loading" :disabled="disabled" >
      <img :src="iconToComponent" height="40" width="40" />
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
      if (this.whichIcon === 'acceptOffer') {
        return this.acceptOffer
      }
      return this.rejectOffer
    }
  },
})
</script>


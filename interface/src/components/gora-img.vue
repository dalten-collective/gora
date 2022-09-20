<template>
  <div>
    <div>
      <img :src="gora.pic" height="200" width="200" @click="openBigImage" :class="detailClass" />
    </div>

    <v-dialog v-model="bigImageOpen">
      <v-card class="tw-bg-white" >
        <v-btn icon="mdi-close" color="error" style="position: absolute; margin-top: 10px; margin-left: 10px;" @click="bigImageOpen = false" />
        <img :src="gora.pic" />
      </v-card>
    </v-dialog>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import type { PropType } from 'vue'
import { Gora } from "@/types";

export default defineComponent({
  props: {
    gora: {
      type: Object as PropType<Gora>
    },
    detailing: {
      type: Boolean,
    },
  },

  data() {
    return {
      bigImageOpen: false,
    }
  },

  computed: {
    detailClass() {
      if (this.detailing) {
        return ['tw-cursor-pointer'];
      }
      return ['']
    },
  },

  methods: {
    openBigImage() {
      if (this.detailing) {
        this.bigImageOpen = true;
      }
    },
  },
})
</script>


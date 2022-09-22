<template>
  <div>
    <div>
      <img class="tw-m-auto" :src="imageSource" :style="styleObject" @click="openBigImage" :class="detailClass" />
    </div>

    <v-dialog v-model="bigImageOpen" fullscreen>
      <v-card class="tw-bg-white" >
        <v-btn icon="mdi-close" color="error" style="position: absolute; margin-top: 10px; margin-left: 10px;" @click="bigImageOpen = false" />
        <div class="tw-m-auto">
          <img :src="imageSource" />
        </div>
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
    urlDirect: {
      type: String
    },
    detailing: {
      type: Boolean,
    },
    thumbnail: {
      type: Boolean,
      default: false,
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

    styleObject() {
      return {
        objectFit: 'contain',
        width: this.thumbnail ? '50px' : '250px',
        height: this.thumbnail ? '50px' : '250px',
      }
    },

    imageSource() {
      if (this.gora) {
        return this.gora.pic
      } else if (this.urlDirect) {
        return this.urlDirect
      }
      return ""
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


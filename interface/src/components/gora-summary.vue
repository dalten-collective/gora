<template>
  <div v-if="haveTheGora">
    <div class="tw-flex tw-justify-between tw-items-center">
      <div class="tw-mr-2">
        <GoraImg thumbnail :gora="theGora" :detailing="detailing" />
      </div>
      <div class="tw-flex-grow tw-text-center">
        {{ theGora.name }}
      </div>
    </div>
    <div class="tw-flex tw-flex-wrap tw-max-w-1/2 tw-my-2" v-if="tags">
      <v-chip
        v-for="t in tagsForGora" :key="t"
        class="tw-mr-1 tw-mb-1"
        variant="outlined" color="info" size="small">
          <v-icon class="tw-mr-1">
            mdi-tag-outline
          </v-icon>
          {{ t }}
      </v-chip>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { mapGetters } from 'vuex';
import { Gora } from '@/types';

import GoraImg from '@/components/gora-img.vue';

export default defineComponent({
  props: {
    goid: {
      type: String,
    },
    tags: {
      type: Boolean,
      default: false,
    },
    stack: {
      type: Boolean,
      default: false,
    },
  },

  computed: {
    ...mapGetters("pita", ["goraByID"]),
    ...mapGetters("meta", ["thisGoraTags"]),

    theGora(): Gora {
      return this.goraByID(this.goid);
    },

    tagsForGora() {
      return this.thisGoraTags(this.goid).map(t => t.tag)
    },
    haveTheGora(): boolean {
      if (this.theGora) {
        return true;
      }
      return false;
    },
  },

  components: {
    GoraImg,
  },
})
</script>


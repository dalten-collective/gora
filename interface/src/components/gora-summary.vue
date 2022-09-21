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
  },

  computed: {
    ...mapGetters("pita", ["goraByID"]),
    theGora(): Gora {
      return this.goraByID(this.goid);
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


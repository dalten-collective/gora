<template>
  <div v-if="haveTheGora">
    <router-link :to="{ name: 'owned-gora-detail', params: { goraID: goid }}">
      View
    </router-link>
    <ul>
      <li v-for="k in Object.keys(theGora)" :key="k" class="tw-grid tw-grid-cols-12">
        <span class="tw-font-mono tw-grid-col-span-4">{{ k }}:</span>
        <span class="tw-grid-col-span-8">{{ theGora[k] }}</span>
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import type { PropType } from "vue";
import { GoraID, Gora } from '../../../types';
import { mapState, mapGetters } from 'vuex'

export default defineComponent({
  props: {
    goid: {
      type: String as PropType<GoraID>,
      default: '0v0',
    },
  },
  computed: {
    ...mapGetters("pita", ["goraByID"]),
    haveTheGora(): boolean {
      if (this.theGora) {
        return true
      }
      return false
    },
    theGora(): Gora {
      return this.goraByID(this.goid);
    },
  },
})
</script>

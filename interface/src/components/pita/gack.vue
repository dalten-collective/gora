<template>
  <div>
    <div class="tw-text-white" :class="statusColor">
      Give {{ !gack.status ? 'attempted' : 'accepted' }} on {{ $filters.sectToDate(gack.when).toLocaleString() }}
      <span v-if="!gack.status">(Gora not available!)</span>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import type { PropType } from "vue";

import { Outgoing } from "@/types";

export default defineComponent({
  props: {
    gack: {
      type: Object as PropType<Outgoing>
    },
  },

  computed: {
    statusColor() {
      if (this.gack.status === '~') {
        return ['tw-bg-warning']
      }
      if (this.gack.status) {
        return ['tw-bg-success']
      } else {
        return ['tw-bg-error']
      }
      return ['tw-bg-gray-400']
    },
  },
})
</script>


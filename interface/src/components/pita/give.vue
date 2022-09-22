<template>
  <div>
    <!-- TODO: Unclear how this works -->
    <div class="tw-text-white tw-p-2" :class="statusColor">
      Offered to <span class="tw-font-mono">{{ give.who }}</span> on {{ $filters.sectToDate(give.when).toLocaleString() }}
      <span v-if="give.status === 'pending'">(Hasn't seen offer yet)</span>
      <span v-if="!give.status">(Gora not available!)</span>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import type { PropType } from "vue";

import { Outgoing } from "@/types";

export default defineComponent({
  props: {
    give: {
      type: Object as PropType<Outgoing>
    },
  },

  computed: {
    statusColor() {
      if (this.give.status === '~' || this.give.status === 'pending') {
        return ['tw-bg-warning']
      }
      if (this.give.status) {
        return ['tw-bg-success']
      } else {
        return ['tw-bg-error']
      }
      return ['tw-bg-gray-400']
    },
  },
})
</script>


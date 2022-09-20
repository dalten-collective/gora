<template>
  <div>
    <div class="tw-text-white" :class="statusColor">
      Given on {{ take.when }}
      <span v-if="!take.status">(Gora not available!)</span>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import type { PropType } from "vue";

import { Outgoing } from "@/types";

export default defineComponent({
  props: {
    take: {
      type: Object as PropType<Outgoing>
    },
  },

  computed: {
    statusColor() {
      if (this.take.status === '~') {
        return ['tw-bg-warning']
      }
      if (this.take.status) {
        return ['tw-bg-success']
      } else {
        return ['tw-bg-error']
      }
      return ['tw-bg-gray-400']
    },
  },
})
</script>


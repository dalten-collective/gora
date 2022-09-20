<template>
  <div>
    <div v-if="log.act === 'give'" class="tw-text-white" :class="statusColor">
      Offered to {{ log.who }} at {{ log.when }}
      <span v-if="log.status === 'pending'">(Hasn't seen offer yet)</span>
      <span v-if="whoHodls">(Now hodls)</span>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import type { PropType } from "vue";

import { Outgoing, Ship } from "@/types";

export default defineComponent({
  props: {
    log: {
      type: Object as PropType<Outgoing>
    },
    hodl: {
      type: Array as PropType<Array<Ship>>
    },
  },

  computed: {
    whoHodls() {
      return this.hodl && this.hodl.includes(this.log.who);
    },

    statusColor() {
      if (this.log.status === 'pending') {
        return ['tw-bg-warning']
      }
      if (this.log.status) {
        return ['tw-bg-success']
      }
      return ['tw-bg-gray-400']
    },
  },
})
</script>


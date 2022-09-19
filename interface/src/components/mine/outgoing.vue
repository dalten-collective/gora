<template>
  <div>
    <div v-if="log.act === 'give'">
      Offered to {{ log.who }} at {{ log.when }} <span v-if="whoHodls">(Now hodls)</span>
    </div>
    <!--
    <ul>
      <li>
        status: {{ log.status }}
      </li>
      <li>
        when: {{ log.when }}
      </li>
      <li>
        who: {{ log.who }}
      </li>
      <li>
        act: {{ log.act }}
      </li>
    </ul>
    -->
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
  },
})
</script>


<template>
  <h1>Hello world</h1>
  This is Start.vue. Be sure to open this file and change <pre>const deskname</pre> to the name of your desk.
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  mounted() {
    const deskname = "todo" // TODO: change to your desk
    this.startAirlock(deskname);
  },
  unmounted() {
    this.closeAirlocks();
  },

  methods: {
    startAirlock(deskname) {
      this.$store.dispatch("ship/openAirlockToAgent", deskname);
    },
    closeAirlocks() {
      this.$store.dispatch("ship/closeAgentAirlocks");
    },
  },
})
</script>



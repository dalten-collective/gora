<template>
  <v-app class="tw-font-silom">
    <div class="tw-container tw-mx-auto">
      <header class="tw-flex tw-justify-around tw-mb-4">
        gora
      </header>

      <div class="tw-mb-4">
        <ul class="tw-flex tw-justify-between">
          <li>
          <router-link :to="{ name: 'pita' }">Pita</router-link>
          </li>
          <li>
          <router-link :to="{ name: 'held' }">Held</router-link>
          </li>
          <li>
          <router-link :to="{ name: 'mine' }">Mine</router-link>
          </li>
        </ul>
      </div>

      <div>
        <router-view />
      </div>

    </div>
  </v-app>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  mounted() {
    const deskname = "gora"
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


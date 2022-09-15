<template>
  <v-app class="tw-font-silom">
    <div class="tw-container tw-mx-auto">
      <header class="tw-flex tw-justify-around tw-mb-4">
        gora
      </header>

      <div v-if="!haveSubscription || !havePita || !haveMeta" class="tw-w-full tw-h-full tw-flex tw-flex-col">
        
        <div class="tw-my-4">
          <v-progress-linear height="25" color="info" rounded v-if="!haveSubscription" indeterminate>
            Connecting to Urbit...
          </v-progress-linear>
        </div>
        <div class="tw-my-4">
          <v-progress-linear height="25" color="info" rounded v-if="!havePita" indeterminate>
            Loading gorae...
          </v-progress-linear>
        </div>
        <div class="tw-my-4">
          <v-progress-linear height="25" color="info" rounded v-if="!haveMeta" indeterminate>
            Fetching logs...
          </v-progress-linear>
        </div>
      </div>
      <div v-else>

        <div class="tw-mb-4">
          <ul class="tw-flex tw-justify-between">
            <li>
            <router-link :to="{ name: 'pita' }">Pita</router-link>
            </li>
            <li>
            <router-link :to="{ name: 'owned' }">Owned</router-link>
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

    </div>
  </v-app>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { mapState } from 'vuex';

export default defineComponent({
  mounted() {
    const deskname = "gora"
    this.startAirlock(deskname);
  },
  unmounted() {
    this.closeAirlocks();
  },

  computed: {
    ...mapState("ship", ["haveSubscription"]),
    ...mapState("pita", ["havePita"]),
    ...mapState("meta", ["haveMeta"]),
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


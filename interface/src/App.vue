<template>
  <v-app class="tw-font-silom">
    <header class="tw-flex tw-flex-col tw-fixed tw-bg-white tw-w-full tw-shadow-md tw-px-2" style="z-index: 50; height: 100px;">
      <div class="tw-flex tw-justify-around tw-mb-4">
        <h1 class="tw-text-3xl tw-text-secondary">
          <router-link :to="{ name: 'pita' }">
            GORA
          </router-link>
        </h1>
      </div>
      <nav class="tw-mb-4 tw-mx-1 md:tw-mx-0">
        <Nav />
      </nav>
    </header>

    <div class="tw-container tw-mx-auto tw-px-1 md:tw-px-0" style="position: relative; top: 100px;">
      <div v-if="!haveSubscription || !havePita || !haveMeta || !haveLogs" class="tw-w-full tw-h-full tw-flex tw-flex-col">
        <div class="tw-my-4">
          <v-progress-linear height="25" color="info" rounded v-if="!haveSubscription" indeterminate>
            Connecting to Urbit...
          </v-progress-linear>
        </div>

        <div class="tw-my-4" v-if="haveSubscription">
          <v-progress-linear height="25" color="info" rounded v-if="!havePita" indeterminate>
            Loading gorae...
          </v-progress-linear>
        </div>
        <div class="tw-my-4" v-if="haveSubscription">
          <v-progress-linear height="25" color="info" rounded v-if="!haveMeta" indeterminate>
            Fetching metadata...
          </v-progress-linear>
        </div>
        <div class="tw-my-4" v-if="haveSubscription">
          <v-progress-linear height="25" color="info" rounded v-if="!haveLogs" indeterminate>
            Fetching interstellar activity...
          </v-progress-linear>
        </div>
      </div>
      <div v-else>

        <div>
          <router-view />
        </div>
      </div>

    </div>
  </v-app>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { mapState, mapGetters } from 'vuex';

import Nav from "@/components/nav.vue";

export default defineComponent({
  mounted() {
    const deskname = "gora"
    this.startAirlock(deskname);
  },
  unmounted() {
    this.closeAirlocks();
  },

  computed: {
    ...mapGetters("logs", ["goraInOffers", "requestsByShip", "goraInShipsRequests"]),
    ...mapState("ship", ["haveSubscription"]),
    ...mapState("pita", ["havePita"]),
    ...mapState("meta", ["haveMeta"]),
    ...mapState("logs", ["haveLogs", "offers", "outgoing"]),
  },

  methods: {
    startAirlock(deskname) {
      this.$store.dispatch("ship/openAirlockToAgent", deskname);
    },
    closeAirlocks() {
      this.$store.dispatch("ship/closeAgentAirlocks");
    },
  },

  components: {
    Nav
  },
})
</script>


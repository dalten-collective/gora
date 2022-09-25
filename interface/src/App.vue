<template>
  <v-app class="tw-font-silom" style="">
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

    <div class="tw-container tw-mx-auto tw-px-1 md:tw-px-0" style="position: relative; top: 100px; height: 100%;">
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

        <div style="margin-bottom: 85px;"> <!-- for mass-manage tray -->
          <router-view />
        </div>
      </div>

    </div>

    <div style="position: relative; z-index: 1;">
      <div style="position: fixed; bottom: 10px; right: 10px;">
        <v-dialog v-model="infoOpen" fullscreen scrim scrollable>
        <template v-slot:activator="{ props }">
          <v-btn size="small" icon v-bind="props" variant="plain" @click="infoOpen = true;">
            <v-icon>
              mdi-help-circle-outline
            </v-icon>
          </v-btn>
        </template>
          <v-card class="tw-bg-white">
            <v-card-title class="tw-flex tw-justify-between">
            <div>
            Wut
            </div>
            <div>
        <v-btn @click="infoOpen = false;" icon="mdi-close" variant="text"/>
        </div>
            </v-card-title>
            <v-card-text>
              <div>
                Gora is a proof of presence protocol for Urbit by <a class="tw-underline" href="https://quartus.co" target="_blank">Quartus</a> and <a class="tw-underline" href="https://dalten.org" taget="_blank">The Dalten Collective</a>.
              </div>
              <div>
                Use it to track attendance, give points to friends each time they make you laugh, or create secret societies.
              </div>
              <div class="tw-my-4">
                The <span class="tw-text-info">Goriverse</span> contains all the gorae you've ever seen or heard about - some of which you may also be <span class="tw-text-info">Hedl</span> by you. You can create your own gorae in <span class="tw-text-info">MINE</span> and subsequently offer them to other ships. You don't automatically hodl gorae that you create - offer them to yourself to own them.
              </div>
              <div class="tw-my-4">
                Gorae can also be made into a "stak". Create a <span class="tw-text-info">Stakable</span> gora and then <span class="tw-text-info">Burn</span> other standard gorae into it to create a stak. Having done so, you can subsequently choose to increment the number that each hodler hodls.
              </div>
              <div class="tw-my-4">
                Find us at <span class="tw-font-mono">~mister-hilper-dozzod-dalten/quartus</span>.
              </div>
            </v-card-text>
          </v-card>
        </v-dialog>
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

  data() {
    return {
      infoOpen: false,
    }
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


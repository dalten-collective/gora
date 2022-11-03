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
              <h1 class="tw-text-3xl tw-mb-4">
                Wut
              </h1>
            </div>
            <div>
        <v-btn @click="infoOpen = false;" icon="mdi-close" variant="text"/>
        </div>
            </v-card-title>
            <v-card-text>
              <div class="tw-ml-4 tw-border-l-2 tw-mb-6 tw-border-info tw-pl-4">
                <div class="tw-mb-2">
                Gora is a proof of presence protocol for Urbit by <a class="tw-underline" href="https://quartus.co" target="_blank">Quartus</a> and <a class="tw-underline" href="https://dalten.org" taget="_blank">The Dalten Collective</a>.
                </div>
                <div>
                  Use it to track attendance, give points to friends each time they make you laugh, or create secret societies.
                </div>
              </div>
              <div class="tw-my-4">
                <h2 class="tw-text-xl tw-mb-4">Lay of the Land</h2>
                The <span class="tw-text-info">Goriverse</span> contains all the gorae you've ever seen or heard about - some of which you may also be <span class="tw-text-info">Hedl</span> by you. You can create your own gorae in <span class="tw-text-info">MINE</span> and subsequently offer them to other ships. You don't automatically hodl gorae that you create - offer them to yourself to own them.
              </div>
              <div class="tw-my-4">
                <h2 class="tw-text-xl tw-mb-4">Staks</h2>
                Gorae can also be made into a "stak". Create a <span class="tw-text-info">Stakable</span> gora and then <span class="tw-text-info">Burn</span> other standard gorae into it to create a stak. Having done so, you can subsequently choose to increment the number that each hodler hodls.
              </div>
              <div class="tw-my-4">
                <h2 class="tw-text-xl tw-mb-4">Public/Private/Gossip</h2>
                When a gora is marked <span class="tw-text-info">Public</span>,
                it will be shared with your <span
                class="tw-font-mono">%pals</span> over the gossip protocol.
                Anyone who sees it in the Goriverse may choose to request it.
              </div>
              <div class="tw-my-4">
                <h2 class="tw-text-xl tw-mb-4 tw-underline">
                  ??
                  <v-icon @click="cultInfo = !cultInfo">mdi-castle</v-icon>
                  ??
                </h2>
                <div v-if="cultInfo">
                  <div>
                    You can start a <span class="tw-text-info">Cult</span> around a gora. This will create a secret group accessible only to the hodlers of this gora.
                  </div>
                  <div>
                    Cult groups are created in the "New Groups" system, which <span class="tw-underline">you</span> and any hodlers will <span class="tw-font-bold tw-underline">need to have installed</span>. At the time of this writing, New Groups is alpha software and no claims are made regarding its stability. Search for <span class="tw-font-mono">~marnec-dozzod-marzod</span> in the app search bar and install <span class="tw-font-mono">Groups</span>.
                  </div>
                  <div class="tw-mt-2">
                    Remember, if you don't hodl the gora (haven't offered it to yourself), you won't be in your own cult...
                  </div>
                  <div class="tw-mt-2">
                    We've received many requests about gora-gated groups and other integrations. <span class="tw-italic">We hear you</span>. The best is yet to come.
                  </div>
                </div>
              </div>
              <div class="tw-my-4">
                <h2 class="tw-text-xl tw-mb-4">Help</h2>
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
      cultInfo: false,
    }
  },

  methods: {
    startAirlock(deskname) {
      this.$store.dispatch("ship/openAirlockToAgent", deskname);
      this.$store.dispatch("cult/openCultlock");
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


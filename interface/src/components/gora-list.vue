<template>
  <div v-if="haveTheGora">
    <router-link :to="linkTo">
      View
    </router-link>

    <router-link v-if="iHostGora" :to="linkToMine">
      Manage
    </router-link>

    <ul>
      <li><pre>Owned: {{ !goraNotOwned(theGora.id) }}</pre></li>
      <li><pre>Made: {{ iHostGora }}</pre></li>
      <li><pre>Requested: {{ requestedThisGora }}</pre></li>
    </ul>

    <div v-if="goraOffered">
      <v-btn
        color="success"
        :loading="transactPending"
        :disabled="transactPending"
        @click="doAcceptOffer"
        >Accept Offer</v-btn
      >
      <v-btn
        color="warning"
        :loading="transactPending"
        :disabled="transactPending"
        @click="doIgnoreOffer"
        >Ignore Offer</v-btn
      >
    </div>

    <div v-if="requestable">
      TODO: don't show if already requested
      <v-btn
        color="success"
        :loading="transactPending"
        :disabled="transactPending"
        @click="doPlea"
        >Request Gora</v-btn
      >
    </div>

    <ul>
      <li
        v-for="k in Object.keys(theGora)"
        :key="k"
        class="tw-grid tw-grid-cols-12"
      >
        <span class="tw-font-mono tw-grid-col-span-4">{{ k }}:</span>
        <span class="tw-grid-col-span-8">{{ theGora[k] }}</span>
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import type { PropType } from "vue";
import { GoraID, Gora } from "../types";
import { mapState, mapGetters } from "vuex";

export default defineComponent({
  props: {
    goid: {
      type: String as PropType<GoraID>,
      default: "0v0",
    },
    fromPage: {
      type: String,
      default: "pita"
    },
  },

  data() {
    return {
      transactPending: false,
    };
  },

  computed: {
    ...mapGetters("pita", ["goraByID"]),
    ...mapGetters("owned", ["goraNotOwned"]),
    ...mapGetters("logs", ["goraInOffers", "requestsByShip", "goraInShipsRequests"]),
    haveTheGora(): boolean {
      if (this.theGora) {
        return true;
      }
      return false;
    },
    theGora(): Gora {
      return this.goraByID(this.goid);
    },

    goraOffered(): boolean {
      return this.goraInOffers(this.goid);
    },
    // ourRequests(): Array<GoraID> {
    //   return this.requestsByShip(this.$filters.sigShip(this.ourShip));
    // },
    requestedThisGora(): boolean {
      return this.goraInShipsRequests(
        { ship: this.$filters.sigShip(this.ourShip), goraID: this.goid }
      )
    },

    requestable(): boolean {
      // TODO: not already requested
      return this.goraNotOwned(this.goid) && !this.iHostGora && !this.requestedThisGora;
    },

    iHostGora(): boolean {
      return this.theGora.host === this.$filters.sigShip(this.ourShip);
    },

    detailPage(): string {
      return `${ this.fromPage }-gora-detail`
    },

    linkTo(): Object {
      return {
        name: this.detailPage,
        params: {
          goraID: this.goid
        }
      }
    },
    linkToMine(): Object {
      return {
        name: 'mine-gora-detail',
        params: {
          goraID: this.goid
        }
      }
    },
  },

  methods: {
    doAcceptOffer(): void {
      this.transactPending = true;
      this.$store.dispatch("logs/pokeAcceptGive", { id: this.goid })
        .then(() => {})
        .finally(() => { this.transactPending = false; })
    },

    doIgnoreOffer(): void {
      this.transactPending = true;
      this.$store.dispatch("logs/pokeIgnoreGive", { id: this.goid })
        .then(() => {})
        .finally(() => { this.transactPending = false; })
    },

    doPlea(): void {
      this.transactPending = true;
      this.$store.dispatch("owned/pokeSendPlea", { id: this.goid, host: this.theGora.host })
        .then(() => {})
        .finally(() => { this.transactPending = false; })
    },
  },
});
</script>

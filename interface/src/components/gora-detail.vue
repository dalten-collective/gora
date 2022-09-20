<template>
  <div v-if="haveTheGora">
    <header class="tw-flex tw-justify-between">
      <span class="tw-underline" @click="this.$emit('close')">Close</span>
    </header>

    <GoraImg :gora="theGora" :detailing="detailing" />

    <div v-if="goraOffered">
    {{ transactPending }}
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
    {{ transactPending }}
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
import GoraImg from "@/components/gora-img.vue";

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
    detailing: {
      type: Boolean
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
    ...mapGetters("logs", ["goraInOffers"]),
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

    requestable(): boolean {
      return this.goraNotOwned(this.goid) && !this.iHostGora;
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

  components: {
    GoraImg
  }
});
</script>

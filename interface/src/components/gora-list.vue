<template>
  <div v-if="haveTheGora">
    <router-link :to="linkTo">
      View
    </router-link>

    <router-link v-if="iHostGora" :to="linkToMine">
      Manage
    </router-link>


    <router-link :to="linkTo">
      <GoraImg :gora="theGora" />
    </router-link>

      <li><pre>Offered: {{ goraOffered }}</pre></li>
      <li><pre>Owned: {{ !goraNotOwned(theGora.id) }}</pre></li>
      <li><pre>Made: {{ iHostGora }}</pre></li>
      <li><pre>Requested: {{ requestedThisGora }}</pre></li>

    <!-- DEBUG
    <ul>
      <li><pre>Owned: {{ !goraNotOwned(theGora.id) }}</pre></li>
      <li><pre>Made: {{ iHostGora }}</pre></li>
      <li><pre>Requested: {{ requestedThisGora }}</pre></li>

      <ul>
        <li v-for="gack in outgoingGacksByID" :key="[gack.id, gack.act, gack.status]">
          <Gack :gack="gack" />
        </li>
      </ul>

      <ul>
        <li v-for="take in outgoingTakesByID" :key="[take.id, take.act, take.status]">
          <Take :take="take" />
        </li>
      </ul>
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
    -->
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import type { PropType } from "vue";
import { GoraID, Gora, Outgoing } from "../types";
import { mapState, mapGetters } from "vuex";
import Gack from "@/components/pita/gack.vue";
import Take from "@/components/pita/take.vue";
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
  },

  components: {
    Gack, Take, GoraImg,
  },

  data() {
    return {
      transactPending: false,
    };
  },

  computed: {
    ...mapGetters("pita", ["goraByID"]),
    ...mapGetters("owned", ["goraNotOwned"]),
    ...mapGetters("logs", ["goraInOffers", "requestsByShip", "goraInShipsRequests", "outgoingFor", "outgoingTakesFor", "outgoingGacksFor"]),
    haveTheGora(): boolean {
      if (this.theGora) {
        return true;
      }
      return false;
    },
    theGora(): Gora {
      return this.goraByID(this.goid);
    },

    outgoingByID(): Array<Outgoing> {
      return this.outgoingFor(this.goid)
    },
    outgoingTakesByID(): Array<Outgoing> {
      return this.outgoingTakesFor(this.goid)
    },
    outgoingGacksByID(): Array<Outgoing> {
      return this.outgoingGacksFor(this.goid)
    },

    goraOffered(): boolean {
      return this.goraInOffers(this.goid);
    },

    requestedThisGora(): boolean {
      return this.outgoingTakesByID.map((o: Outgoing) => o.id).includes(this.goid)
    },
    gackedThisGora(): boolean {
      return this.outgoingGacksByID.map((o: Outgoing) => o.id).includes(this.goid)
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

<template>
  <div v-if="haveTheGora">
    <router-link :to="{ name: 'mine-gora-detail', params: { goraID: goid }}">
      Manage
    </router-link>

    <GoraImg :gora="theGora" />

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
import {
  GoraID,
  Gora,
  PokeRmGoraPayload,
  GoraIDShip,
} from "../../types";

import { mapState, mapGetters } from "vuex";

import Outgoing from "@/components/mine/outgoing.vue"
import GoraImg from "@/components/gora-img.vue";

export default defineComponent({
  props: {
    goid: {
      type: String as PropType<GoraID>,
      default: "0v0",
    },
  },

  data() {
    return {
      rmPending: false,
      showConfirmDelete: false,
      transactPending: false,
      recipients: [] as Array<Ship>,
      recipientAdd: '',
      offerPending: false,
    };
  },

  computed: {
    ...mapGetters("pita", ["goraByID"]),
    ...mapState("logs", ["requests", "outgoing"]),
    ...mapGetters("logs", ["requestsForID", "outgoingFor"]),

    requestsByID() {
      return this.requestsForID(this.goid);
    },
    outgoingByID() {
      return this.outgoingFor(this.goid);
    },

    haveTheGora(): boolean {
      if (this.theGora) {
        return true;
      }
      return false;
    },
    theGora(): Gora {
      return this.goraByID(this.goid);
    },
  },

  methods: {
    addToRecipients() {
      if (!this.recipientAdd) {
        return;
      }

      if (!this.recipients.includes(this.recipientAdd)) {
        this.recipients.push(this.recipientAdd)
      }
      this.recipientAdd = "";
    },

    removeFromRecipients(ship: string) {
      this.recipients = this.recipients.filter((s: string) => s !== ship)
    },


    doOffer() {
      this.offerPending = true;
      this.$store.dispatch("made/pokeGiveGora", { id: this.goid, who: this.recipients })
        .then((r) => {
        })
        .catch((e) => {
        })
        .finally(() => {
          this.offerPending = false;
          this.resetOffer()
        })
    },

    resetOffer() {
      this.recipients = [];
    },

    doDelete() {
      this.rmPending = true;
      const payload: PokeRmGoraPayload = {
        id: this.goid,
      };
      this.$store
        .dispatch("pita/pokeRmGora", payload)
        .then((r) => {})
        .catch((e) => {})
        .finally(() => {
          this.rmPending = false;
        });
    },

    acceptRequest(ship) {
      this.transactPending = true;
      const payload: GoraIDShip = {
        id: this.goid,
        ship,
      };
      this.$store
        .dispatch("made/pokeAcceptRequest", payload)
        .then((r) => {})
        .catch((e) => {})
        .finally(() => {
          this.transactPending = false;
        });
    },

    ignoreRequest(ship) {
      this.transactPending = true;
      const payload: GoraIDShip = {
        id: this.goid,
        ship,
      };
      this.$store
        .dispatch("made/pokeIgnoreRequest", payload)
        .then((r) => {})
        .catch((e) => {})
        .finally(() => {
          this.transactPending = false;
        });
    },
  },

  components: {
    Outgoing, GoraImg
  },
});
</script>

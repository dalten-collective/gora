<template>
  <div v-if="haveTheGora">
    <span @click="$emit('close')">Close</span>
    <GoraImg :gora="theGora" :detailing="detailing" />

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

    <div>
      Outgoing
      <ul>
        <li><Outgoing v-for="o in outgoingByID" :log="o" :hodl="theGora.hodl" /></li>
      </ul>
    </div>

    <div>
      Offer:
      <div>
        <ul>
          <li v-for="ship in recipients" :key="ship">
            {{ ship }}
            <span @click="removeFromRecipients(ship)">Remove</span>
          </li>
        </ul>
      </div>
      <v-text-field
        v-model="recipientAdd"
        placeholder="~sampel-palnet, "
        label="Offer to..."
        @keyup.enter="addToRecipients"
      />
      <v-btn @click="addToRecipients">Add</v-btn>
      <br />
      <v-btn @click="doOffer">Offer</v-btn>
    </div>
    Requests:
    <ul>
      <li v-for="ship in requestsByID" :key="ship">
        {{ ship }}
        <v-btn
          @click="acceptRequest(ship)"
          :loading="transactPending"
          :disabled="transactPending"
          >Give</v-btn
        >
        <v-btn
          @click="ignoreRequest(ship)"
          :loading="transactPending"
          :disabled="transactPending"
          >Ignore</v-btn
        >
      </li>
    </ul>
    <v-btn @click="showConfirmDelete = true">Delete</v-btn>
    <v-dialog v-model="showConfirmDelete">
      <v-card class="tw-bg-white tw-p-4">
        <v-card-title>Delete Gora?</v-card-title>
        <v-card-text>
          Are you sure you want to delete this gora? TODO: explanation
        </v-card-text>
        <v-card-actions>
          <v-btn @click="showConfirmDelete = false">No</v-btn>
          <v-btn @click="doDelete">Yes</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
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
    fromPage: {
      type: String,
      default: "mine"
    },
    detailing: {
      type: Boolean,
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

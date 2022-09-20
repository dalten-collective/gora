<template>
  <div v-if="haveTheGora">
    <header class="tw-flex tw-justify-between">
      <div></div>
      <div>
        <span class="tw-underline tw-cursor-pointer" @click="this.$emit('close')">Close</span>
      </div>
    </header>

    <article>

      <div class="tw-flex">
        <div>
          <GoraImg :gora="theGora" :detailing="detailing" />
          <div style="height: 0; position: relative; bottom: 65px;" class='tw-flex tw-flex-row tw-justify-between tw-m-2'>
            <ImageButton
              img="https://picsum.photos/30/30"
              v-if="goraOffered"
              color="success"
              hint="Accept this offer"
              :loading="transactPending"
              :disabled="transactPending"
              @click="doAcceptOffer"
              which-icon="acceptOffer"
            />
            <ImageButton
              img="https://picsum.photos/30/30"
              v-if="goraOffered"
              color="error"
              hint="Ignore this offer"
              :loading="transactPending"
              :disabled="transactPending"
              @click="doIgnoreOffer"
              which-icon="rejectOffer"
            />
          </div>
        </div>
      </div>

      <!--
      TODO:

      - need to get gacks, takes in here. consider using props.

      -->

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

    </article>

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
      return this.goraNotOwned(this.goid) && !this.iHostGora && !this.goraOffered;
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

<template>
  <div v-if="haveTheGora">
    <!-- we don't want the buttons to animate -->
    <div
      style="height: 0; position: relative; top: 220px; z-index: 100"
      class="tw-flex tw-flex-row tw-justify-between tw-m-2"
    >
      <ImageButton
        img="https://picsum.photos/30/30"
        v-if="goraOffered"
        color="success"
        hint="Accept this offer"
        :loading="transactPending"
        :disabled="transactPending"
        @click.stop="doAcceptOffer"
        which-icon="acceptOffer"
      />
      <ImageButton
        img="https://picsum.photos/30/30"
        v-if="goraOffered"
        color="error"
        hint="Ignore this offer"
        :loading="transactPending"
        :disabled="transactPending"
        @click.stop="doIgnoreOffer"
        which-icon="rejectOffer"
      />
    </div>

    <div
      class="tw-p-3 tw-rounded-md"
      :class="(goraBorderClasses)"
    >
      <article>
        <div class="tw-flex tw-flex-col">
          <div class="tw-flex tw-justify-between">
            <div style="position: relative" v-if="thisGoraPub(goid)">
              <v-tooltip position="left">
                <template v-slot:activator="{ props }">
                  <v-icon
                    v-bind="props"
                    style="position: absolute; top: 10px; left: 10px"
                    variant="outlined"
                  >
                    mdi-eye
                  </v-icon>
                </template>
                <span> Public </span>
              </v-tooltip>
            </div>

          </div>

          <div>
            <router-link :to="linkTo">
              <GoraImg :gora="theGora" />
            </router-link>
          </div>

          <div class="tw-class-flex tw-justify-space-around">
            <div class="tw-max-w-[250px] tw-flex tw-justify-between">
              <h1
                class="tw-text-center"
                style="
                  white-space: nowrap;
                  width: 250px;
                  overflow: hidden;
                  text-overflow: ellipsis;
                "
              >
                {{ theGora.name }}
                <v-tooltip activator="parent" location="bottom">
                  {{ theGora.name }}
                </v-tooltip>
              </h1>
                <div>
                  <div v-if="sType">
                    <v-tooltip position="left">
                      <template v-slot:activator="{ props }">
                        <v-icon
                          color="warning"
                          v-bind="props"
                        >
                          mdi-circle-multiple-outline
                        </v-icon>
                      </template>
                      <span> Stak </span>
                    </v-tooltip>
                  </div>
                </div>

            </div>
          </div>
        </div>

        <footer class="tw-flex tw-justify-between tw-min-h-[32px]">
          <div class="tw-min-h-[32px]">
            <v-tooltip bottom>
              <template v-slot:activator="{ props }">
                <v-icon v-bind="props" color="warning" v-if="unique">
                  mdi-flare
                </v-icon>
              </template>
              <span>Unique gora! You are the only hodler.</span>
            </v-tooltip>
          </div>

          <router-link v-if="iHostGora" :to="linkToMine">
            <v-btn
              icon="mdi-pencil"
              variant="outline"
              color="info"
              size="x-small"
            />
          </router-link>
        </footer>
      </article>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import type { PropType } from "vue";
import { GoraID, Gora, Outgoing } from "../types";
import { mapState, mapGetters } from "vuex";

import GoraImg from "@/components/gora-img.vue";
import Gack from "@/components/pita/gack.vue";
import Take from "@/components/pita/take.vue";

export default defineComponent({
  props: {
    goid: {
      type: String as PropType<GoraID>,
      default: "0v0",
    },
    fromPage: {
      type: String,
      default: "pita",
    },
  },

  components: {
    Gack,
    Take,
    GoraImg,
  },

  data() {
    return {
      transactPending: false,
    };
  },

  computed: {
    ...mapGetters("pita", ["goraByID"]),
    ...mapGetters("owned", ["goraNotOwned"]),
    ...mapGetters("logs", [
      "goraInOffers",
      "requestsByShip",
      "goraInShipsRequests",
      "outgoingFor",
      "outgoingTakesFor",
      "outgoingGacksFor",
      "goraInRequests",
    ]),
    ...mapGetters("meta", ["thisGoraPub"]),

    unique(): boolean {
      return (
        this.theGora.max === 1 &&
        this.theGora.hodl.includes(this.$filters.sigShip(this.ourShip))
      );
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

    outgoingByID(): Array<Outgoing> {
      return this.outgoingFor(this.goid);
    },
    outgoingTakesByID(): Array<Outgoing> {
      return this.outgoingTakesFor(this.goid);
    },
    outgoingGacksByID(): Array<Outgoing> {
      return this.outgoingGacksFor(this.goid);
    },

    goraOffered(): boolean {
      return this.goraInOffers(this.goid);
    },

    goraOwned(): boolean {
      return !this.goraNotOwned(this.goid)
    },

    outstandingRequest() {
      if (this.goraInRequests(this.goid) && this.goraNotOwned(this.goid)) {
        return true
      }
      return false
    },

    requestedThisGora(): boolean {
      return this.outgoingTakesByID
        .map((o: Outgoing) => o.id)
        .includes(this.goid);
    },

    iHostGora(): boolean {
      return this.theGora.host === this.$filters.sigShip(this.ourShip);
    },

    detailPage(): string {
      return `${this.fromPage}-gora-detail`;
    },

    linkTo(): Object {
      return {
        name: this.detailPage,
        params: {
          goraID: this.goid,
        },
      };
    },

    linkToMine(): Object {
      return {
        name: "mine-gora-detail",
        params: {
          goraID: this.goid,
        },
      };
    },

    goraBorderClasses(): Array<string> {
      var classes = ["tw-border-2", "tw-rounded-md"];
      if (this.goraOwned && !this.iHostGora) {
        classes.push("tw-border-gray-400")
        classes.push("tw-shadow-md")
      }

      if (this.outstandingRequest || this.goraOffered) {
        classes.push("tw-border-dashed");
        classes.push("tw-shadow-none")
      }

      if (this.iHostGora) {
        classes.push("tw-border-info", "tw-border-opacity-40");
        classes.push("tw-shadow-md")
      }

      if (this.goraOffered) {
        classes.push("tw-animate-pulse");
      }

      return classes;
    },

    gType(): boolean {
      return this.haveTheGora && this.theGora.hasOwnProperty("hodl");
    },
    sType(): boolean {
      return this.haveTheGora && this.theGora.hasOwnProperty("stak");
    },
  },

  methods: {
    doAcceptOffer(): void {
      this.transactPending = true;
      this.$store
        .dispatch("logs/pokeAcceptGive", { id: this.goid })
        .then(() => {})
        .finally(() => {
          this.transactPending = false;
        });
    },

    doIgnoreOffer(): void {
      this.transactPending = true;
      this.$store
        .dispatch("logs/pokeIgnoreGive", { id: this.goid })
        .then(() => {})
        .finally(() => {
          this.transactPending = false;
        });
    },

    doPlea(): void {
      this.transactPending = true;
      this.$store
        .dispatch("owned/pokeSendPlea", {
          id: this.goid,
          host: this.theGora.host,
        })
        .then(() => {})
        .finally(() => {
          this.transactPending = false;
        });
    },
  },
});
</script>

<style scoped>
.stak {
  /*
    position: relative;
    bottom: 20px;
    right: 30px;
    color: red;
    */
}
</style>

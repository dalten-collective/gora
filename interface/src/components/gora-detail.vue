<template>
  <div v-if="haveTheGora">
    <header class="tw-flex tw-justify-between tw-mb-4">
      <div></div>
      <div>
        <v-btn @click="this.$emit('close')" icon="mdi-close" variant="text"/>
      </div>
    </header>

    <article class="tw-mb-6">
      <div class="tw-flex tw-flex-col">

        <header class="tw-flex tw-justify-around tw-mb-8">
          <v-spacer />
          <div class="tw-flex tw-flex-col tw-flex-grow">
            <div class="inner-shadow-gora tw-bg-surface tw-mx-auto tw-p-8 tw-rounded-lg">
              <GoraImg :gora="theGora" :detailing="detailing" />
            </div>
            <div
              style="height: 0; position: relative; bottom: 65px"
              class="tw-flex tw-flex-row tw-justify-between tw-m-2 tw-m-auto tw-w-[270px]"
            >
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

            <div class="tw-class-flex tw-justify-space-around tw-m-auto tw-my-4">
              <div class="tw-text-center tw-max-w-[250px]">
                <h1 class="tw-text-xl">
                  <span class="tw-mr-2">{{ theGora.name }}</span>
                  <span v-if="sType">
                    <v-chip v-if="myStack && myStack.hasOwnProperty('has')" color="success">
                    (x{{ myStack.has }})
                      <v-tooltip activator="parent">
                        You have {{ myStack.has }} of these
                      </v-tooltip>
                    </v-chip>
                  </span>
                  <v-tooltip bottom>
                    <template v-slot:activator="{ props }">
                      <v-icon v-bind="props" color="warning" v-if="unique">
                        mdi-flare
                      </v-icon>
                    </template>
                    <span>Unique gora! You are the only hodler.</span>
                  </v-tooltip>
                </h1>
                <span v-if="outstandingRequest" class="tw-text-warning tw-animate-pulse">
                  (You've requested this. No response yet...)
                </span>
                <span v-if="goraOffered" class="tw-text-warning tw-animate-pulse">
                  (You've been offered this gora. Accept or ignore above.)
                </span>
              </div>
            </div>

            <div class="tw-class-flex tw-justify-space-around tw-m-auto tw-mb-2">
              <div class="tw-text-center tw-max-w-[250px] tw-flex tw-flex-col tw-items-center">
                <v-chip variant="outlined" size="small" color="info">
                  {{ theGora.host }}
                </v-chip>
                <div v-if="requestable" class="tw-ml-2 tw-mt-2">
                  <v-btn
                    size="small"
                    color="success"
                    :loading="transactPending"
                    :disabled="transactPending"
                    @click="doPlea"
                    >
                      <span v-if="goraInRequests(goid)">
                        Request again!
                      </span>
                      <span v-else>
                        Request Gora
                      </span>
                    </v-btn
                  >
                </div>


                <div class="tw-ml-2">
                  <v-btn color="info" icon v-if="iHostGora && thisGoraPub(goid)">
                    <v-icon>
                      mdi-eye
                    </v-icon>
                    <v-tooltip activator="parent">
                      Public
                    </v-tooltip>
                  </v-btn>

                  <v-btn icon color="grey" v-else-if="iHostGora && !thisGoraPub(goid)">
                    <v-icon>
                      mdi-eye-off
                    </v-icon>
                    <v-tooltip activator="parent">
                      Private
                    </v-tooltip>
                  </v-btn>
                </div>
              </div>
            </div>

              <div class="tw-class-flex tw-justify-space-around tw-m-auto tw-mb-4">
                <div class="tw-flex tw-flex-wrap tw-max-w-1/2 tw-my-2" v-if="tagsForGora.length > 0">
                  <v-chip
                    v-for="t in tagsForGora" :key="t"
                    class="tw-mr-1 tw-mb-1"
                    variant="outlined" color="info" size="small">
                      <v-icon class="tw-mr-1">
                        mdi-tag-outline
                      </v-icon>
                      {{ t }}
                  </v-chip>
                </div>
              </div>

            <div class="tw-class-flex tw-justify-space-around tw-m-auto tw-mt-4 tw-mb-2">
              <div class="tw-text-center">
                <span class="tw-underline tw-cursor-pointer tw-text-sm tw-text-info" @click="showDetails = !showDetails">Details</span>

                <div v-if="showDetails" class="tw-grid md:tw-hidden tw-grid-rows-2 tw-gap-2 tw-p-4">
                  <div class="tw-row-span-2 tw-border tw-border-gora">
                    <div class="tw-text-center tw-p-1">
                      ID <v-btn v-if="!copyDone" size="x-small" variant="text" @click="copyID" color="info" icon="mdi-content-copy" /> <span v-if="copyDone" class="tw-text-info">Copied!</span>
                    </div>
                    <div class="tw-text-center tw-bg-surface tw-p-2">
                      <span class="tw-font-mono tw-text-xs" ref="goraID" >{{ theGora.id }}</span>
                    </div>
                  </div>

                  <div class="tw-row-span-2 tw-border tw-border-gora">
                    <div class="tw-text-center tw-p-1">
                      Created on
                    </div>
                    <div class="tw-text-center tw-bg-surface tw-p-2">
                      {{ $filters.goraMadeDate(theGora) }}
                    </div>
                  </div>

                  <div class="tw-row-span-2 tw-border tw-border-gora">
                    <div class="tw-text-center tw-p-1">
                      Max hodlers
                    </div>
                    <div class="tw-text-center tw-bg-surface tw-p-2">
                      <span v-if="unique">
                        Only 1: Just you!
                      </span>
                      <span v-else-if="!theGora.max">
                        Unlimited
                      </span>
                      <span v-else>
                        {{ theGora.max }}
                      </span>
                    </div>
                  </div>

                </div>

                <div v-if="showDetails" class="tw-grid-cols-12 tw-gap-2 tw-border tw-rounded-gora tw-p-4 tw-hidden md:tw-grid">
                  <div class="tw-col-span-2 tw-text-right tw-p-2">
                     <v-btn v-if="!copyDone" size="x-small" variant="text" @click="copyID" color="info" icon="mdi-content-copy" />
                     <span v-if="copyDone" class="tw-text-info">Copied!</span> ID
                  </div>
                  <div class="tw-col-span-10 tw-text-left tw-bg-surface tw-p-2">
                    <span class="tw-font-mono">{{ theGora.id }}</span>
                  </div>

                  <div class="tw-col-span-2 tw-text-right tw-p-2">
                    Created on
                  </div>
                  <div class="tw-col-span-10 tw-text-left tw-bg-surface tw-p-2">
                    {{ $filters.goraMadeDate(theGora) }}
                  </div>

                  <div class="tw-col-span-2 tw-text-right tw-p-2">
                    Max hodlers
                  </div>
                  <div class="tw-col-span-10 tw-text-left tw-bg-surface tw-p-2">
                    <span v-if="unique">
                      Only 1: Just you!
                    </span>
                    <span v-else-if="!theGora.max">
                      Unlimited
                    </span>
                    <span v-else>
                      {{ theGora.max }}
                    </span>
                  </div>
                </div>

              </div>
            </div>

          </div>
          <v-spacer />
        </header>

        <div class="tw-flex tw-flex-row">
          <v-spacer />
          <div class="tw-flex-grow tw-w-full">
            <v-expansion-panels variant="accordion">

              <v-expansion-panel class="tw-bg-surface" v-if="sType">
                <v-expansion-panel-title>
                  <h3>Hodlers ({{ theGora.stak.length === 0 ? 'None' : theGora.stak.length }})</h3>
                </v-expansion-panel-title>
                <v-expansion-panel-text>
                  <v-btn
                    class="tw-mr-2 tw-my-2"
                    v-for="stak in stackHodlerOrdered"
                    :key="stak"
                    variant="flat"
                    color="info"
                  >
                    <span class="tw-font-mono">{{ $filters.sigShip(stak.who) }} ({{ stak.has }})</span>
                  </v-btn>
                </v-expansion-panel-text>
              </v-expansion-panel>

              <v-expansion-panel v-if="theGora.type === 's'" class="tw-bg-surface">
                <v-expansion-panel-title>
                  <h3>Gorae in Stak ({{ nulStack.length }})</h3>
                </v-expansion-panel-title>
                <v-expansion-panel-text>
                  <div class="tw-flex tw-flex-col">
                    <div v-for="g in nulStack" :key="g.id" class="tw-border tw-bg-white tw-shadow-inner tw-rounded-md tw-mb-2 tw-px-4 tw-py-2">
                      <div class="tw-flex tw-items-center"> 
                        {{ g.name }}
                        <div class="tw-w-32">
                          <GoraImg :url-direct="g.pic" thumbnail />
                        </div>
                      </div> 

                    </div>
                  </div>
                </v-expansion-panel-text>
              </v-expansion-panel>

              <v-expansion-panel v-if="gType" class="tw-bg-surface">
                <v-expansion-panel-title>
                  <h3>Hodlers</h3>
                </v-expansion-panel-title>
                <v-expansion-panel-text>
                  <ul>
                    <li
                      v-for="ship in theGora.hodl"
                      :key="ship"
                    >
                      {{ $filters.sigShip(ship) }}
                    </li>
                  </ul>
                </v-expansion-panel-text>
              </v-expansion-panel>

              <v-expansion-panel class="tw-bg-surface">
                <v-expansion-panel-title>
                  <h3>History</h3>
                </v-expansion-panel-title>
                <v-expansion-panel-text>
                  <ul class="tw-mb-4">
                    <li
                      class="tw-mb-2"
                      v-for="give in outgoingGivesFor(theGora.id)"
                      :key="[give.id, give.act, give.status]"
                    >
                      <Give :give="give" />
                    </li>
                  </ul>

                  <ul class="tw-mb-4">
                    <li
                      class="tw-mb-2"
                      v-for="gack in outgoingGacksByID"
                      :key="[gack.id, gack.act, gack.status]"
                    >
                      <Gack :gack="gack" />
                    </li>
                  </ul>
                  <ul>
                    <li
                      class="tw-mb-2"
                      v-for="take in outgoingTakesByID"
                      :key="[take.id, take.act, take.status]"
                    >
                      <Take :take="take" />
                    </li>
                  </ul>
                </v-expansion-panel-text>

              </v-expansion-panel>
            </v-expansion-panels>
          </div>

          <v-spacer />
        </div>
      </div>
      <!-- main column -->

    </article>
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
import Give from "@/components/pita/give.vue";

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
    detailing: {
      type: Boolean,
    },
  },

  data() {
    return {
      transactPending: false,
      showDetails: false,
      copyDone: false,
    };
  },

  computed: {
    ...mapGetters("pita", ["goraByID"]),
    ...mapGetters("cult", ["cultsAroundGora"]),
    ...mapGetters("owned", ["goraNotOwned"]),
    ...mapGetters("logs", [
      "goraInOffers",
      "outgoingTakesFor",
      "outgoingGacksFor",
      "outgoingGivesFor",
      "goraInRequests",
    ]),
    ...mapGetters("meta", ["thisGoraTags", "thisGoraPub"]),
    stackHodlerOrdered() {
      if (this.sType) {
        return this.theGora.stak.slice().sort((h, h2) => {
          return h2.has - h.has
        })
      }
      return []
    },
    outstandingRequest() {
      if (this.goraInRequests(this.goid) && this.goraNotOwned(this.goid)) {
        return true
      }
      return false
    },
    nulStack(): Array {
      if (this.theGora.hasOwnProperty('nul') && this.theGora.nul !== null) {
        return this.theGora.nul
      } else {
        return []
      }
    },

    gType(): boolean {
      return this.haveTheGora && this.theGora.hasOwnProperty('hodl');
    },
    sType(): boolean {
      return this.haveTheGora && this.theGora.hasOwnProperty('stak');
    },

    tagsForGora() {
      return this.thisGoraTags(this.goid).map(t => t.tag)
    },

    unique(): boolean {
      return this.theGora.max === 1 && this.theGora.hodl.includes(this.$filters.sigShip(this.ourShip))
    },

    myStack(): number {
      if (this.sType) {
        return this.theGora.stak.find((s) => s.who === this.$filters.sigShip(this.ourShip))
      }
      return []
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

    outgoingGacksByID(): Array<Outgoing> {
      return this.outgoingGacksFor(this.goid);
    },
    outgoingTakesByID(): Array<Outgoing> {
      return this.outgoingTakesFor(this.goid);
    },

    goraOffered(): boolean {
      return this.goraInOffers(this.goid);
    },

    requestable(): boolean {
      return (
        this.goraNotOwned(this.goid) && !this.iHostGora
      );
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
  },

  methods: {
    copyID(): void {
      navigator.clipboard.writeText(this.goid);
      this.copyDone = true;
      setTimeout(() => {
        this.copyDone = false;
      }, 1500)
    },

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

  components: {
    GoraImg,
    Gack,
    Take,
    Give,
  },
});
</script>

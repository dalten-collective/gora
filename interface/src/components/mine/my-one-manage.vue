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

              <div class="tw-class-flex tw-justify-space-around tw-m-auto tw-my-4">
                <div class="tw-text-center tw-max-w-[250px]">
                  <h1 class="tw-text-xl">
                    <span class="tw-mr-2">{{ theGora.name }}</span>
                  </h1>
                </div>
              </div>

              <div class="tw-class-flex tw-justify-space-around tw-m-auto tw-mb-4">
                <div class="tw-text-center tw-max-w-[250px] tw-flex tw-items-center">
                  <v-chip variant="outlined" size="small" color="info">
                    you host
                  </v-chip>

                  <div class="tw-ml-2">
                    <v-btn color="info" icon v-if="thisGoraPub(goid)" @click="makePriv" :loading="pubPending">
                      <v-icon>
                        mdi-eye
                      </v-icon>
                      <v-tooltip activator="parent">
                        Currently public. Click to make private.
                      </v-tooltip>
                    </v-btn>

                    <v-btn v-else icon color="grey" @click="makePub" :loading="pubPending">
                      <v-icon>
                        mdi-eye-off
                      </v-icon>
                      <v-tooltip activator="parent">
                        Currently private. Click to make public.
                      </v-tooltip>
                    </v-btn>
                  </div>

                </div>
              </div>

              <div class="tw-class-flex tw-justify-space-around tw-m-auto tw-mb-8">
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


              <div class="tw-class-flex tw-justify-space-around tw-m-auto tw-my-4 tw-mb-2">
                <div class="tw-text-center">
                  <div class="tw-grid md:tw-hidden tw-grid-rows-2 tw-gap-2 tw-w-full">
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
                        <span v-if="!theGora.max">
                          Unlimited
                        </span>
                        <span v-else>
                          {{ theGora.max }}
                        </span>
                      </div>
                    </div>

                  </div>

                  <div class="tw-grid-cols-12 tw-gap-2 tw-border tw-rounded-gora tw-p-4 tw-hidden md:tw-grid">
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
                      <MaxDisplayEdit :goid="goid" />
                    </div>
                  </div>

                </div>
              </div>
            </div>
          <v-spacer />
        </header>

        <div class="tw-flex tw-flex-row">
          <v-spacer />
          <div class="tw-flex-grow">
            <v-expansion-panels variant="accordion">

              <v-expansion-panel v-if="theGora.type === 's'" class="tw-bg-surface">
                <v-expansion-panel-title>
                  <h3>Gorae in Stak ({{ nulStack.length }})</h3>
                </v-expansion-panel-title>
                <v-expansion-panel-text>
                  <div v-for="g in nulStack">
                    {{ g.name }}
                  </div>
                </v-expansion-panel-text>
              </v-expansion-panel>

              <v-expansion-panel class="tw-bg-surface" v-if="gType">
                <v-expansion-panel-title>
                  <h3>Hodlers ({{ theGora.hodl.length === 0 ? 'None' : theGora.hodl.length }})</h3>
                </v-expansion-panel-title>
                <v-expansion-panel-text>
                  <v-chip
                    class="tw-mr-2 tw-my-2"
                    v-for="ship in theGora.hodl"
                    :key="ship"
                    variant="flat"
                    color="info"
                  >
                    <span class="tw-font-mono">{{ $filters.sigShip(ship) }}</span>
                  </v-chip>
                </v-expansion-panel-text>
              </v-expansion-panel>
              <v-expansion-panel class="tw-bg-surface" v-if="sType">
                <v-expansion-panel-title>
                  <h3>Hodlers ({{ theGora.stak.length === 0 ? 'None' : theGora.stak.length }})</h3>
                </v-expansion-panel-title>
                <v-expansion-panel-text>
                  <div class="tw-my-4">

                  <v-btn
                    class="tw-mr-2 tw-my-2"
                    v-for="stak in stackHodlerOrdered"
                    :key="stak"
                    variant="flat"
                    color="info"
                    append-icon="mdi-plus"
                    :pending="pointPending"
                    @click="sendPoint(stak.who)"
                  >
                    <span class="tw-font-mono">{{ $filters.sigShip(stak.who) }} ({{ stak.has }})</span>
                  </v-btn>

                  <v-divider class="tw-my-4" />

                    <v-form @submit.prevent="">
                      <div class="tw-flex tw-flex-col">
                        <div>
                          <h3 class="tw-text-lg">Offer to...</h3>
                        </div>
                        <ShipList @updateList="updateRecipients" ref="offerList" />
                      </div>
                    </v-form>
                    <v-btn block color="success" @click="doOffer" :disabled="recipients.length === 0 || offerPending" :loading="offerPending">Send Offers</v-btn>
                  </div>

                </v-expansion-panel-text>
              </v-expansion-panel>

              <v-expansion-panel v-if="requestsByID.length > 0" class="tw-bg-surface">
                <v-expansion-panel-title>
                  <h3>Requests</h3>
                  <v-badge color="info" :content="requestsByID.length" inline class="tw-animate-pulse">
                  </v-badge>
                </v-expansion-panel-title>
                <v-expansion-panel-text>
                  <ul>
                    <li v-for="ship in requestsByID" class="tw-mb-2 tw-bg-white tw-shadow-inner tw-rounded-sm tw-border tw-p-2 tw-flex tw-justify-between" :key="ship">
                      <div>
                        <span class="tw-font-mono">{{ ship }}</span>
                      </div>
                      <div>
                        <v-btn
                          class="tw-mr-2"
                          @click="acceptRequest(ship)"
                          :loading="transactPending"
                          :disabled="transactPending"
                          color="success"
                          ><v-icon>mdi-thumb-up-outline</v-icon>Give</v-btn
                        >
                        <v-btn
                          @click="ignoreRequest(ship)"
                          :loading="transactPending"
                          :disabled="transactPending"
                          color="error"
                          ><v-icon>mdi-thumb-down-outline</v-icon>
                          Ignore</v-btn>
                      </div>
                    </li>
                  </ul>
                </v-expansion-panel-text>
              </v-expansion-panel>

              <v-expansion-panel class="tw-bg-surface" v-if="gType">
                <v-expansion-panel-title>
                  <h3>Offers</h3>
                </v-expansion-panel-title>
                <v-expansion-panel-text>
                  <div class="tw-my-4">
                    <v-form @submit.prevent="">
                      <div class="tw-flex tw-flex-col">
                        <div>
                          <h3 class="tw-text-lg">Offer to...</h3>
                        </div>
                        <ShipList @updateList="updateRecipients" ref="offerList" />
                      </div>
                    </v-form>
                    <v-btn block color="success" @click="doOffer" :disabled="recipients.length === 0 || offerPending" :loading="offerPending">Send Offers</v-btn>
                  </div>

                  <v-divider class="tw-my-4" />

                  <div class="tw-rounded-sm tw-shadow-inner tw-p-4 tw-bg-white">
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
                  </div>
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

      <footer class='tw-flex tw-justify-end tw-mt-10'>
        <v-btn icon="mdi-delete" @click="showConfirmDelete = true" color="error"/>
      </footer>
    </article>


    <v-dialog v-model="showConfirmDelete">
      <v-card class="tw-bg-white tw-p-4">
        <v-card-title class="tw-text-error">Delete Gora?</v-card-title>
        <v-card-text>
          Are you sure you want to delete this gora? Any outstanding offers will be abandoned.<br />
          You cannot undo this!
        </v-card-text>
        <v-card-actions class="tw-flex tw-justify-between">
          <v-btn @click="showConfirmDelete = false">No! Don't delete it.</v-btn>
          <v-btn color="error" @click="doDelete">Yes, kill it.</v-btn>
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
import Give from "@/components/pita/give.vue";
import Take from "@/components/pita/take.vue";
import ShipList from "@/components/ship-list.vue";
import MaxDisplayEdit from "@/components/mine/max-display-edit.vue";
import GoraSummary from "@/components/gora-summary.vue";

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
      pubPending: false,
      rmPending: false,
      showConfirmDelete: false,
      transactPending: false,
      recipients: [] as Array<Ship>,
      recipientAdd: '',
      offerPending: false,
      copyDone: false,
      pointPending: false,
    };
  },

  computed: {
    ...mapGetters("pita", ["goraByID"]),
    ...mapState("logs", ["requests", "outgoing"]),
    ...mapGetters("logs", ["requestsForID", "outgoingFor", "outgoingTakesByID", "outgoingGivesFor"]),
    ...mapGetters("meta", ["thisGoraTags", "thisGoraPub"]),
    stackHodlerOrdered() {
      if (this.sType) {
        return this.theGora.stak.slice().sort((h, h2) => {
          return h2.has - h.has
        })
      }
      return []
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
    sendPoint(ship) {
      this.pointPending = true
      this.$store.dispatch("made/pokeGiveGora", { id: this.goid, who: [ship] })
        .then((r) => {
        })
        .catch((e) => {
        })
        .finally(() => {
          this.pointPending = false;
        })
    },

    updateRecipients(list) {
      this.recipients = list;
    },

    makePub() {
      this.pubPending = true;
      this.$store.dispatch("meta/pokePubMod", { id: this.goid, how: true })
        .finally(() => {
          this.pubPending = false;
        })
    },
    makePriv() {
      this.pubPending = true;
      this.$store.dispatch("meta/pokePubMod", { id: this.goid, how: false })
        .finally(() => {
          this.pubPending = false;
        })
    },

    copyID(): void {
      navigator.clipboard.writeText(this.goid);
      this.copyDone = true;
      setTimeout(() => {
        this.copyDone = false;
      }, 1500)
    },

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
      this.$refs.offerList.resetList()
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
    Outgoing, GoraImg, Give, Take, ShipList, MaxDisplayEdit, GoraSummary
  },
});
</script>

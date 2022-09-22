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
              <div class="tw-class-flex tw-justify-space-around tw-m-auto tw-mb-2">
                <div class="tw-text-center tw-max-w-[250px]">
                  <v-chip variant="outlined" size="small" color="info">
                    you host
                  </v-chip>
                </div>
              </div>


              <div class="tw-class-flex tw-justify-space-around tw-m-auto tw-mb-2">
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
          <div class="tw-flex-grow">
            <v-expansion-panels variant="accordion">

              <v-expansion-panel class="tw-bg-surface">
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
                          ><v-icon>mdi-home</v-icon>Give</v-btn
                        >
                        <v-btn
                          @click="ignoreRequest(ship)"
                          :loading="transactPending"
                          :disabled="transactPending"
                          color="error"
                          >Ignore</v-btn
                        >
                      </div>
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
                  {{ outgoingGivesFor(theGora.id) }}
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
    </article>

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
      copyDone: false,
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

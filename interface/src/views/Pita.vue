<template>
  <div>
    <div class="tw-flex tw-flex-col">
      <header class="tw-mb-6 tw-mt-10 tw-text-xl tw-flex-col tw-flex md:tw-flex-row tw-px-2 md:tw-px-0">
        <div class="tw-flex-1 tw-text-left">
        </div>
        <div class="tw-flex-1 tw-text-center">
          Gorae I Know About
        </div>
        <div class="tw-flex-1 tw-text-right">
          <v-dialog v-model="requesting" scrim scrollable max-width="700">
            <template v-slot:activator="{ props }">
              <v-btn v-bind="props" class="tw-hidden md:tw-block" color="success" variant="outlined" @click="requesting = true;">
                <v-icon>
                  mdi-plus
                </v-icon>
                <v-tooltip activator="parent" location="left">
                  Request a gora
                </v-tooltip>
              </v-btn>

              <v-btn block v-bind="props" class="tw-mt-2 tw-block md:tw-hidden" color="success" variant="outlined" @click="requesting = true;">
                <v-icon>
                  mdi-plus
                </v-icon>
                <v-tooltip activator="parent" location="bottom">
                  Request a gora
                </v-tooltip>
              </v-btn>

            </template>
            <v-card class="tw-bg-white tw-p-4">
              <v-card-title class="tw-flex tw-justify-between">
                <div>
                  Request Gora
                </div>
                <div>
                  <span @click="requesting = false;" class="tw-underline tw-cursor-pointer">Close</span>
                </div>
              </v-card-title>
              <v-card-text>
                <RequestForm />
              </v-card-text>
            </v-card>
          </v-dialog>
        </div>
      </header>

      <div class="tw-mb-6 tw-mt-4 tw-flex-col tw-justify-around tw-text-center md:tw-text-left tw-flex md:tw-flex-row tw-px-2 md:tw-px-0 md:tw-justify-between">

        <div class="tw-flex">
          <div class="tw-flex tw-flex-wrap">
            <div class="tw-mr-2">
              <v-tooltip activator="parent" location="top">
                Requests you've made
              </v-tooltip>
              <v-btn variant='outlined' color="info" v-if="filtering !== 'requested'" @click="filtering = 'requested'">
                Requests
              </v-btn>
              <v-btn variant='tonal' color="info" v-if="filtering === 'requested'" @click="filtering = ''" class="tw-shadow-md">
                Requests
              </v-btn>
            </div>

            <div class="tw-mr-2">
              <v-tooltip activator="parent" location="top">
                Offers you can accept
              </v-tooltip>
              <v-btn variant='outlined' color="info" v-if="filtering !== 'offered'" @click="filtering = 'offered'">
                Offers
              </v-btn>
              <v-btn variant='tonal' color="info" v-if="filtering === 'offered'" @click="filtering = ''" class="tw-shadow-md">
                Offers
              </v-btn>
            </div>

            <div>
              <v-tooltip activator="parent" location="top">
                Gorae in pals gossip network
              </v-tooltip>
              <v-btn variant='outlined' color="info" v-if="filtering !== 'gossip'" @click="filtering = 'gossip'">
                Whispers
              </v-btn>
              <v-btn variant='tonal' color="info" v-if="filtering === 'gossip'" @click="filtering = ''" class="tw-shadow-md">
                Whispers
              </v-btn>
            </div>
          </div>
        </div>

        <div class="tw-mt-4 md:tw-mt-0">
          <div class="md:tw-w-[25em]">
            <v-autocomplete
              color="info"
              :items="hostShips"
              v-model="hostFilter"
              label="Host"
              append-icon="mdi-close"
              @click:append="hostFilter = 'All'"
            />
          </div>
        </div>
      </div>
    </div>

    <div class="tw-text-center tw-opacity-50">
      <div v-if="hostFilter !== 'All'">
        Gorae hosted by {{ hostFilter }}
      </div>

      <div v-if="filtering === 'offered'">
        <div v-if="filteredOrderedIDs.length === 0">
          No outstanding offers <span v-if="hostFilter !== 'All'">with {{ hostFilter }}</span>
        </div>
        <div v-else>
          Outstanding offers <span v-if="hostFilter !== 'All'">with {{ hostFilter }}</span>
        </div>
      </div>

      <div v-if="filtering === 'requested'">
        <div v-if="filteredOrderedIDs.length === 0">
          No outstanding requests <span v-if="hostFilter !== 'All'">with {{ hostFilter }}</span>
        </div>
        <div v-else>
          Outstanding requests <span v-if="hostFilter !== 'All'">with {{ hostFilter }}</span>
        </div>
      </div>

      <div v-if="filtering === 'gossip'">
        <div v-if="filteredOrderedIDs.length === 0">
          No gorae in your gossip network <span v-if="hostFilter !== 'All'">from {{ hostFilter }}.</span><span v-else>. Find some pals!</span>
        </div>
        <div v-else>
          All gorae in your gossip network <span v-if="hostFilter !== 'All'">from {{ hostFilter }}</span>
        </div>
      </div>
    </div>

    <div class="tw-flex tw-justify-around tw-flex-wrap">
      <div v-for="goid in filteredOrderedIDs" :key="goid" >
        <GoraList :goid="goid" class="tw-mb-4"/>
      </div>
      <div v-if="pitaIDs.length === 0">
        <div class="tw-border tw-rounded-sm tw-p-8 tw-mt-8 tw-shadow">
          You've never seen any gorae. <span class="tw-cursor-pointer tw-text-success tw-underline" @click="requesting = true;">Request</span> or <router-link class="tw-cursor-pointer tw-text-success tw-underline" :to="{ name: 'mine' }" >make</router-link> some!
        </div>
      </div>
    </div>

    <v-dialog v-if="idDetailable(detailedID)" v-model="detailOpen" scrollable max-width="700">
      <v-card class="tw-bg-white">
        <v-card-title></v-card-title>
        <v-card-text>
          <div v-if="idDetailable(detailedID)">
            <GoraDetail :goid="detailedID" from-page="pita" @close="detailOpen = false" :detailing="detailOpen"/>
          </div>
        </v-card-text>
      </v-card>
    </v-dialog>

    <v-dialog v-model="notFoundOpen" scrollable max-width="700">
      <v-card class="tw-bg-white tw-p-4">
        <v-card-title>Not Found</v-card-title>
        <v-card-text>
          Check that gora id...
        </v-card-text>
      </v-card>
    </v-dialog>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { mapGetters } from "vuex";

import GoraDetail from "@/components/gora-detail.vue"
import GoraList from "@/components/gora-list.vue"
import RequestForm from "@/components/owned/request-form.vue"

import {
  Gora,
  GoraID,
} from '@/types'

export default defineComponent({
  computed: {
    ...mapGetters("pita", ["pitaIDs", "goraByID"]),
    ...mapGetters("logs", ["goraInOffers", "goraInRequests"]),
    ...mapGetters("owned", ["goraNotOwned"]),
    filteredOrderedIDs() {
      var filtered = this.orderedIDs
      if (this.hostFilter !== 'All') {
        filtered = filtered.filter((id: GoraID) => {
          return this.$filters.sigShip(this.goraByID(id).host) === this.hostFilter
        })
      }

      if (this.filtering === 'gossip') {
        filtered = filtered.filter((id: GoraID) => {
          return this.goraGossiped(id)
        })
      }

      if (this.filtering === 'offered') {
        filtered = filtered.filter((id: GoraID) => {
          return this.goraInOffers(id)
        })
      }

      if (this.filtering === 'requested') {
        filtered = filtered.filter((id: GoraID) => {
          return this.goraInRequests(id)
        })
      }

      return filtered
    },

    orderedIDs() {
      const offers = []
      const normal = []
      const requests = []
      this.pitaIDs.forEach((id: GoraID) => {
        if (this.goraInOffers(id)) {
          offers.push(id)
        } else if (this.outstandingRequest(id)) {
          requests.push(id)
        } else {
          normal.push(id)
        }
      })
      return offers.concat(normal).concat(requests)
    },

    hostShips() {
      const hostOptions = ['All']
      const ships = Array.from(
        new Set(
          this.pitaIDs.map((id: GoraID) => {
            return this.goraByID(id).host
          })
        )
      )
      return hostOptions.concat(ships)
    },
  },

  data() {
    return {
      requesting: false,
      detailOpen: false,
      notFoundOpen: false,
      detailedID: null as string | null,
      filtering: '',
      hostFilter: 'All',
    }
  },

  mounted() {
    const goraID = this.$route.params.goraID?.toString()
    if (goraID && this.idDetailable(goraID)) {
      this.detailOpen = true;
      this.detailedID = goraID;
    } else if (goraID && !this.idDetailable(goraID)) {
      this.notFoundOpen = true;
    }
  },

  watch: {
    '$route' (to, from) {
      const goraID = to.params.goraID
      if (goraID && this.haveTheGora(goraID)) {
        this.detailOpen = true;
        this.detailedID = goraID;
      } else {
        this.detailOpen = false;
        this.detailedID = null;
      }
    },

    detailOpen (val, oldVal) {
      if (!val) {
        this.detailOpen = false;
        this.$router.push({ name: 'pita' })
        this.detailedID = null;
      }
    },
    notFoundOpen (val, oldVal) {
      if (!val) {
        this.notFoundOpen = false;
        this.$router.push({ name: 'pita' })
      }
    },
  },

  methods: {
    outstandingRequest(goraID: GoraID) {
      if (this.goraInRequests(goraID) && this.goraNotOwned(goraID)) {
        return true
      }
      return false
    },

    goraGossiped(goraID) {
      if (
        !this.goraInRequests(goraID) &&
        !this.goraInOffers(goraID) &&
        this.goraNotOwned(goraID) &&
        !this.iHostGora(goraID)
      ) {
        return true
      }
      return false
    },

    iHostGora(goraID): boolean {
      return this.goraByID(goraID).host === this.$filters.sigShip(this.ourShip);
    },

    idDetailable(goraID) {
      if (goraID && this.haveTheGora(goraID)) {
        return true
      }
      return false
    },

    haveTheGora(goraID): boolean {
      if (this.theGora(goraID)) {
        return true
      }
      return false
    },
    theGora(goraID): Gora {
      return this.goraByID(goraID);
    },
  },

  components: {
    GoraDetail,
    GoraList,
    RequestForm,
  }
})
</script>


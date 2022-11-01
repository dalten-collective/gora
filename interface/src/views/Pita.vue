<template>
  <div>
    <header class="tw-mb-6 tw-mt-10 tw-text-xl tw-flex-col tw-flex md:tw-flex-row tw-px-2 md:tw-px-0">
      <div class="tw-flex-1 tw-text-left">
      </div>
      <div class="tw-flex-1 tw-text-center">
        Gorae I Know About
      </div>
      <div class="tw-flex-1 tw-text-right">
        <v-dialog v-model="requesting" scrim scrollable>
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

    <div class="tw-flex tw-justify-around tw-flex-wrap">
      <div v-for="goid in orderedIDs" :key="goid" >
        <GoraList :goid="goid" class="tw-mb-4"/>
      </div>
      <div v-if="pitaIDs.length === 0">
        <div class="tw-border tw-rounded-sm tw-p-8 tw-mt-8 tw-shadow">
          You've never seen any gorae. <span class="tw-cursor-pointer tw-text-success tw-underline" @click="requesting = true;">Request</span> or <router-link class="tw-cursor-pointer tw-text-success tw-underline" :to="{ name: 'mine' }" >make</router-link> some!
        </div>
      </div>
    </div>

    <v-dialog v-if="idDetailable(detailedID)" v-model="detailOpen" scrollable>
      <v-card class="tw-bg-white">
        <v-card-title></v-card-title>
        <v-card-text>
          <div v-if="idDetailable(detailedID)">
            <GoraDetail :goid="detailedID" from-page="pita" @close="detailOpen = false" :detailing="detailOpen"/>
          </div>
        </v-card-text>
      </v-card>
    </v-dialog>

    <v-dialog v-model="notFoundOpen" scrollable>
      <v-card class="tw-bg-white">
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

      return this.pitaIDs.sort((a: GoraID, b: GoraID) => {
        if (this.goraInOffers(a) && !this.goraInOffers(b)) {
          return -1
        }
        if (this.outstandingRequest(a) && !this.outstandingRequest(b)) {
          return 1;
        }
        return 0;
      })
    },
  },

  data() {
    return {
      requesting: false,
      detailOpen: false,
      notFoundOpen: false,
      detailedID: null as string | null,
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
      console.log('na', goraID)
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


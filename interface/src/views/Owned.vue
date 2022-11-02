<template>
  <div>

    <header class="tw-mb-6 tw-mt-10 tw-text-xl tw-flex-col tw-flex md:tw-flex-row tw-px-2 md:tw-px-0">
      <div class="tw-flex-1 tw-text-left">
      </div>
      <div class="tw-flex-1 tw-text-center">
        Gorae I Hold
      </div>
      <div class="tw-flex-1 tw-text-right">
      </div>
    </header>

    <div class="tw-mb-6 tw-mt-4 tw-flex-col tw-justify-around tw-text-center md:tw-text-left tw-flex md:tw-flex-row tw-px-2 md:tw-px-0 md:tw-justify-between">

      <div class="tw-flex">
      </div>

      <div class="tw-mt-4 md:tw-mt-0">
        <div class="md:tw-w-[25em]">
          <v-select
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

    <div class="tw-text-center tw-opacity-50">
      <div v-if="hostFilter !== 'All'">
        Gorae hosted by {{ hostFilter }}
      </div>
    </div>

    <div class="tw-flex tw-justify-around tw-flex-wrap">
      <div v-for="goid in filteredOwned" :key="goid">
        <GoraList :goid="goid" class="tw-mb-4" from-page="hedl" />
      </div>
      <div v-if="owned.length === 0">
        <div class="tw-border tw-rounded-sm tw-p-8 tw-mt-8 tw-shadow">
          You don't own any gorae. <router-link class="tw-cursor-pointer tw-text-success tw-underline" :to="{ name: 'pita' }" >Request</router-link> or <router-link class="tw-cursor-pointer tw-text-success tw-underline" :to="{ name: 'mine' }" >make</router-link> some!
        </div>
      </div>
    </div>

    <v-dialog v-if="idDetailable(detailedID)" v-model="detailOpen" scrollable max-width="700">
      <v-card class="tw-bg-white">
        <v-card-title></v-card-title>
        <v-card-text>
          <div v-if="idDetailable(detailedID)">
            <GoraDetail :goid="detailedID" from-page="hedl" :detailing="detailOpen" @close="detailOpen = false"/>
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
import { defineComponent } from "vue";
import { mapState, mapGetters } from "vuex";
import GoraDetail from "@/components/gora-detail.vue"
import GoraList from "@/components/gora-list.vue"

import {
  GoraID
} from "@/types";

export default defineComponent({
  data() {
    return {
      detailOpen: false,
      notFoundOpen: false,
      detailedID: null as string | null,
      hostFilter: 'All',
    }
  },

  computed: {
    ...mapState("owned", ["owned"]),
    ...mapState("logs", ["offers"]),
    ...mapGetters("pita", ["pitaIDs", "goraByID"]),
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

    filteredOwned() {
      var filtered = this.owned
      if (this.hostFilter !== 'All') {
        filtered = filtered.filter((id: GoraID) => {
          return this.$filters.sigShip(this.goraByID(id).host) === this.hostFilter
        })
      }
      return filtered
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
        this.$router.push({ name: 'hedl' })
        this.detailedID = null;
      }
    },
    notFoundOpen (val, oldVal) {
      if (!val) {
        this.notFoundOpen = false;
        this.$router.push({ name: 'hedl' })
      }
    },
  },

  methods: {
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
  components: { GoraDetail, GoraList },
});
</script>

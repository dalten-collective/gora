<template>
  <div>
    <header class="tw-mb-4 tw-text-xl">Pita</header>
    <div v-for="goid in pitaIDs" :key="goid" >
      <router-link :to="{ name: 'pita-gora-detail', params: { goraID: goid }}">
        <PitaOneGora :goid="goid" class="tw-mb-4"/>
      </router-link>
    </div>
    <v-dialog v-if="idDetailable(detailedID)" v-model="detailOpen" scrollable>
      <v-card class="tw-bg-white">
        <v-card-title></v-card-title>
        <v-card-text>
          <div v-if="idDetailable(detailedID)">
            <PitaOneGora :goid="detailedID" />
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
import PitaOneGora from "@/components/pita/pita-one-gora.vue"

import {
  Gora
} from '@/types'

export default defineComponent({
  computed: {
    ...mapGetters("pita", ["pitaIDs", "goraByID"]),
  },

  data() {
    return {
      detailOpen: false,
      detailedID: '',
    }
  },

  mounted() {
    const goraID = this.$route.params.goraID
    if (goraID) {
      this.detailOpen = true;
      this.detailedID = goraID;
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

  components: {
    PitaOneGora,
  }
})
</script>


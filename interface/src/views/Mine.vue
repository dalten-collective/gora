<template>
  <div>

    <header class="tw-mb-6 tw-mt-10 tw-text-xl tw-flex-col tw-flex md:tw-flex-row tw-px-2 md:tw-px-0">
      <div class="tw-flex-1 tw-text-left">
      </div>
      <div class="tw-flex-1 tw-text-center">
        Gorae I've Made
        <v-btn @click="getAllCults">Get cults</v-btn>
      </div>

      <div class="tw-flex-1 tw-text-right">
        <v-dialog v-model="making" fullscreen scrim scrollable>
          <template v-slot:activator="{ props }">
            <v-btn class="tw-hidden md:tw-block" v-bind="props" color="success" variant="outlined" @click="making = true;">
              <v-icon>
                mdi-plus
              </v-icon>
              <v-tooltip activator="parent" location="left">
                Mint a new gora
              </v-tooltip>
            </v-btn>

            <v-btn block class="tw-mt-2 tw-block md:tw-hidden" v-bind="props" color="success" variant="outlined" @click="making = true;">
              <v-icon>
                mdi-plus
              </v-icon>
              <v-tooltip activator="parent" location="bottom">
                Mint a new gora
              </v-tooltip>
            </v-btn>
          </template>
          <v-card class="tw-bg-white tw-p-4">
            <v-card-title class="tw-flex tw-justify-between">
              <div>
                Create Gora
              </div>
              <div>
                <span @click="making = false;" class="tw-underline tw-cursor-pointer">Close</span>
              </div>
            </v-card-title>
            <v-card-text>
              <MkForm @closeMk="making = false" />
            </v-card-text>
          </v-card>
        </v-dialog>
      </div>
    </header>

    <div class="tw-flex tw-justify-around tw-flex-wrap">
      <div v-for="goid in orderedMade" :key="goid" style="position: relative;">
          <v-badge v-if="goraHasNotifs(goid)" color="info" class="tw-animate-pulse" style="position: absolute; left: 99%; top: 5px;">
          </v-badge>
          <MadeGoraList :goid="goid" class="tw-mb-4" from-page="mine" />
      </div>
      <div v-if="made.length === 0">
        <div class="tw-border tw-rounded-sm tw-p-8 tw-mt-8 tw-shadow">
          Nothing to see here. <span class="tw-cursor-pointer tw-text-success tw-underline" @click="making = true;">Make</span> some gorae!
        </div>
      </div>
    </div>

    <div v-if="goraeSelected.length > 0" style="position: fixed; bottom: 0; z-index: 100;" class="md:px-2 tw-bg-surface tw-py-4 tw-rounded-md tw-shadow-lg tw-border md:tw-right-0" >
      <MassManage />
    </div>

    <v-dialog v-if="idDetailable(detailedID)" v-model="detailOpen" scrollable max-width="700">
      <v-card class="tw-bg-white">
        <v-card-title></v-card-title>
        <v-card-text>
          <div v-if="idDetailable(detailedID)">
            <MyOneManage :goid="detailedID" from-page="mine" @close="detailOpen = false" :detailing="detailOpen" />
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
import cultAPI from "@/api"

import {
  GoraID
} from "@/types"

import MkForm from "@/components/mine/mk-form.vue"
import MadeGoraList from "@/components/mine/made-gora-list.vue"
import MyOneManage from "@/components/mine/my-one-manage.vue"
import MassManage from "@/components/mine/mass-manage.vue"

export default defineComponent({
  data() {
    return {
      making: false,
      detailOpen: false,
      notFoundOpen: false,
      detailedID: null as string | null,
    }
  },

  computed: {
    ...mapState("made", ["made", "goraeSelected"]),
    ...mapGetters("pita", ["pitaIDs", "goraByID"]),
    ...mapGetters("logs", ["requestsForID", "outgoingFor"]),
    ...mapState("meta", ["tags"]),
    orderedMade() {
      return this.made.sort((a: GoraID, b: GoraID) => {
        if (this.goraHasNotifs(a)) {
          return -1
        }
        return 1
      })
    },
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
        this.$router.push({ name: 'mine' })
        this.detailedID = null;
      }
    },
    notFoundOpen (val, oldVal) {
      if (!val) {
        this.notFoundOpen = false;
        this.$router.push({ name: 'mine' })
      }
    },
  },

  methods: {
    getAllCults() {
      cultAPI.getCults()
    },

    goraHasNotifs(goraID) {
      return this.requestsForID(goraID).length > 0
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

  components: { MkForm, MadeGoraList, MyOneManage, MassManage },
});
</script>

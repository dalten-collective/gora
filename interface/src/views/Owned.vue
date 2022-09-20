<template>
  <div>
    <v-dialog v-model="requesting" scrim scrollable>
      <template v-slot:activator="{ props }">
        <v-btn v-bind="props" color="info" @click="requesting = true;">Request</v-btn>
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

    <header class="tw-my-4 tw-text-xl">Owned</header>

    <div v-for="goid in owned" :key="goid">
      <GoraList :goid="goid" class="tw-mb-4"/>
    </div>

    <v-dialog v-if="idDetailable(detailedID)" v-model="detailOpen" scrollable>
      <v-card class="tw-bg-white">
        <v-card-title></v-card-title>
        <v-card-text>
          <div v-if="idDetailable(detailedID)">
            <GoraDetail :goid="detailedID" from-page="pita" @close="detailOpen = false"/>
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
import { defineComponent } from "vue";
import { mapState, mapGetters } from "vuex";
import GoraDetail from "@/components/gora-detail.vue"
import RequestForm from "@/components/owned/request-form.vue"
import GoraList from "@/components/gora-list.vue"

export default defineComponent({
  data() {
    return {
      requesting: false,
      detailOpen: false,
      notFoundOpen: false,
      detailedID: null as string | null,
    }
  },

  computed: {
    ...mapState("owned", ["owned"]),
    ...mapState("logs", ["offers"]),
    ...mapGetters("pita", ["pitaIDs", "goraByID"]),
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
        this.$router.push({ name: 'owned' })
        this.detailedID = null;
      }
    },
    notFoundOpen (val, oldVal) {
      if (!val) {
        this.notFoundOpen = false;
        this.$router.push({ name: 'owned' })
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
  components: { GoraDetail, RequestForm, GoraList },
});
</script>

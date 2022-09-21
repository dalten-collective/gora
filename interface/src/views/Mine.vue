<template>
  <div>
    <v-dialog v-model="making" fullscreen scrim scrollable>
      <template v-slot:activator="{ props }">
        <v-btn v-bind="props" color="info" @click="making = true;">Create</v-btn>
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

    <header class="tw-mb-4 tw-text-xl">Mine</header>

    <div class="tw-flex tw-justify-around tw-flex-wrap">
      <div v-for="goid in made" :key="goid">
        <MadeGoraList :goid="goid" class="tw-mb-4" from-page="mine"/>
      </div>
    </div>

    <v-dialog v-if="idDetailable(detailedID)" v-model="detailOpen" scrollable>
      <v-card class="tw-bg-white">
        <v-card-title></v-card-title>
        <v-card-text>
          <div v-if="idDetailable(detailedID)">
            <MyOneManage :goid="detailedID" from-page="mine" @close="detailOpen = false" :detailing="detailOpen" />
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
import MkForm from "@/components/mine/mk-form.vue"
import MadeGoraList from "@/components/mine/made-gora-list.vue"
import MyOneManage from "@/components/mine/my-one-manage.vue"

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
    ...mapState("made", ["made"]),
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

  components: { MkForm, MadeGoraList, MyOneManage },
});
</script>

<template>
  <div class="tw-w-screen md:tw-w-[500px] tw-px-2" style="z-index: 100;">
    <div class="tw-flex tw-justify-between">
      <!-- <v-btn @click="sendOpen = true">send</v-btn> -->

      <v-btn icon color="success" @click="addTagOpen = true;">
        <v-icon>
          mdi-tag-plus
        </v-icon>
        <v-tooltip activator="parent" location="top">
          Tag selected
        </v-tooltip>
      </v-btn>

      <v-btn icon color="error" @click="unTagOpen = true;">
        <v-icon>
          mdi-tag-minus
        </v-icon>
        <v-tooltip activator="parent" location="top">
          Remove tag from selected
        </v-tooltip>
      </v-btn>

      <v-btn icon color="warning" @click="openBurn" >
        <v-icon>
          mdi-circle-multiple-outline
        </v-icon>
        <v-tooltip v-if="stackableSelected" activator="parent" location="top">
          Cannot put stakable gorae into another stak
        </v-tooltip>
        <v-tooltip v-else activator="parent" location="top">
          Stak selected
        </v-tooltip>
      </v-btn>

      <v-btn icon color="info" @click="deselectAll">
        <v-icon>
          mdi-close
        </v-icon>
        <v-tooltip activator="parent" location="top">
          Deselect all
        </v-tooltip>
      </v-btn>

      <v-btn icon color="info" @click="selectAll">
        <v-icon>
          mdi-check-all
        </v-icon>
        <v-tooltip activator="parent" location="top">
          Select all
        </v-tooltip>
      </v-btn>

    </div>

    <!-- <MassSend v-model="sendOpen" @closeDialog="sendOpen = false;" /> -->

    <MassBurn v-model="burnOpen" @closeDialog="burnOpen = false;" />
    <MassTag v-model="addTagOpen" @closeDialog="addTagOpen = false;" />
    <MassUnTag v-model="unTagOpen" @closeDialog="unTagOpen = false;" />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { mapState, mapGetters } from "vuex";

// import MassSend from "@/components/mine/mass-send.vue";
import MassBurn from "@/components/mine/mass-burn.vue";
import MassTag from "@/components/mine/mass-tag.vue";
import MassUnTag from "@/components/mine/mass-un-tag.vue";

export default defineComponent({
  computed: {
    ...mapState("made", ["goraeSelected"]),
    ...mapGetters("pita", ["stackableSelected"]),
  },

  data() {
    return {
      // sendOpen: false,
      burnOpen: false,
      addTagOpen: false,
      unTagOpen: false,
    };
  },

  components: {
    MassBurn, MassTag, MassUnTag
  },

  methods: {
    deselectAll() {
      // TODO: when filters are here, will need to NOT do it like this
      this.$store.dispatch("made/deselectAll")
    },
    selectAll() {
      // TODO: when filters are here, will need to NOT do it like this
      this.$store.dispatch("made/selectAll")
    },
    openBurn() {
      if (this.stackableSelected(this.goraeSelected)) {
        return
      } else {
        this.burnOpen = true;
      }
    },

  },
});
</script>

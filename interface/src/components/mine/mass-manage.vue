<template>
  <div class="tw-w-screen md:tw-w-[500px] tw-px-2">
    <div class="tw-flex tw-justify-between">
      <!-- <v-btn @click="sendOpen = true">send</v-btn> -->

      <v-btn icon color="success">
        <v-icon>
          mdi-tag-plus
        </v-icon>
        <v-tooltip activator="parent" location="top">
          Not yet implemented
          <!--
          Tag selected
          -->
        </v-tooltip>
      </v-btn>

      <v-btn icon color="error">
        <v-icon>
          mdi-tag-minus
        </v-icon>
        <v-tooltip activator="parent" location="top">
          Not yet implemented
          <!--
          Remove tag from selected
          -->
        </v-tooltip>
      </v-btn>

      <v-btn icon color="warning" @click="burnOpen = true" >
        <v-icon>
          mdi-circle-multiple-outline
        </v-icon>
        <v-tooltip activator="parent" location="top">
          Stack selected
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
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { mapState } from "vuex";

// import MassSend from "@/components/mine/mass-send.vue";
import MassBurn from "@/components/mine/mass-burn.vue";

export default defineComponent({
  computed: {
    ...mapState("made", ["goraeSelected"]),
  },

  data() {
    return {
      // sendOpen: false,
      burnOpen: false,
    };
  },

  components: {
    // MassSend,
    MassBurn
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
  },
});
</script>

<template>
  <div>
    <div>
      <!-- <v-btn @click="sendOpen = true">send</v-btn> -->
      <v-btn>add tags</v-btn>
      <v-btn>remove tags</v-btn>
      <v-btn @click="burnOpen = true">burn/stack</v-btn>
      <v-btn>Deselect all</v-btn>
      <v-btn>Select all</v-btn>
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
  },
});
</script>

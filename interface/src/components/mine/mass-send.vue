<template>
    <v-dialog v-model="dialogOpen" persistent scrollable>
      <v-card class="tw-bg-white">
        <v-card-title class="tw-flex tw-justify-between">
          <div></div>
          <div>
            Offer Gorae
          </div>
          <div class="tw-text-right">
            <v-btn icon="mdi-close" variant="text" @click="sendOpen = false;" />
          </div>
        </v-card-title>

        <v-card-text>
          <div class="tw-flex tw-my-4">
            <v-spacer class="tw-hidden md:tw-block" />

            <div class="tw-flex-grow">
              <div class="tw-flex tw-flex-col tw-flex-grow tw-mb-6">
                <GoraSummary
                  class="tw-border tw-border-gora tw-p-2 tw-mb-2"
                  :goid="goid"
                  :key="goid"
                  v-for="goid in goraeSelected"
                />
              </div>

              <div class="tw-my-4">
                <v-form @submit.prevent="">
                  <div class="tw-flex tw-flex-col">
                    <div>
                      <h3 class="tw-text-lg">Send to...</h3>
                    </div>
                    <ShipList @updateList="updateOurList" />
                  </div>
                </v-form>
              </div>

              <div class="tw-flex tw-justify-end">
                <v-btn color="success" :loading="sendPending" :disabled="sendPending || offerList.length === 0" @click="sendGorae">Send</v-btn>
              </div>

            </div>

            <v-spacer class="tw-hidden md:tw-block" />
          </div>

          <!-- end offer -->
        </v-card-text>
      </v-card>
    </v-dialog>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { mapState } from "vuex";

import GoraSummary from "@/components/gora-summary.vue";
import ShipList from "@/components/ship-list.vue";

export default defineComponent({
  props: {
    dialogOpen: {
      type: Boolean
    }
  },

  computed: {
    ...mapState("made", ["goraeSelected"]),
  },

  data() {
    return {
      offerList: [],
      sendPending: false,
    }
  },

  components: {
    GoraSummary,
    ShipList,
  },

  methods: {
    updateOurList(list) {
      this.offerList = list;
    },

    sendGorae() {
      // TODO: can't send many gorae to many ships just yet
      this.sendPending = true;
      this.sendPending = false;
      this.$emit('closeDialog')
    },
  },

})
</script>


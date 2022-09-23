<template>
    <v-dialog v-model="dialogOpen" scrollable>
      <v-card class="tw-bg-white">
        <v-card-title class="tw-flex tw-justify-between">
          <div></div>
          <div>
            Un-Tag Gorae
          </div>
          <div class="tw-text-right">
            <v-btn icon="mdi-close" variant="text" @click="closeDialog" />
          </div>
        </v-card-title>

        <v-card-text>
          <div class="tw-flex tw-my-4">
            <v-spacer class="tw-hidden md:tw-block" />

            <div class="tw-flex-grow">
              <div class="tw-p-4 tw-rounded-md tw-bg-surface tw-shadow-inner tw-mb-6">
                <div class="tw-mb-4 tw-text-center">
                  <h2 class="tw-text-error">
                    Gorae to un-tag
                  </h2>
                </div>
                <div class="tw-flex tw-flex-col tw-flex-grow">
                  <GoraSummary
                    class="tw-border tw-rounded-sm tw-border-error tw-bg-white tw-p-2 tw-mb-2"
                    :goid="goid"
                    :key="goid"
                    v-for="goid in goraeSelected"
                    tags
                  />
                </div>
              </div>

              <div class="tw-p-4 tw-border-gora tw-mb-6 tw-rounded-sm tw-shadow-inner">
                <v-form ref="tagForm" @submit.prevent="" >
                  <v-select
                    :items="tags.map(t => t.tag)"
                    v-model="existingTagName"
                    label="Remove tag"
                  />
                  </v-form>
              </div>

              <div class="tw-flex tw-justify-end">
                <v-btn color="success" :loading="tagPending" block :disabled="tagPending || existingTagName == ''" @click="unTagGorae">remove tag</v-btn>
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
import GoraImg from "@/components/gora-img.vue";

export default defineComponent({
  props: {
    dialogOpen: {
      type: Boolean
    }
  },

  computed: {
    ...mapState("made", ["goraeSelected"]),
    ...mapState("meta", ["tags"]),
  },

  data() {
    return {
      tagPending: false,
      newTagName: '',
      existingTagName: '',
    }
  },

  watch: {
    newTagName(val) {
      if (val) {
        this.existingTagName = ''
      }
    },
    existingTagName(val) {
      if (val) {
        this.newTagName = ''
      }
    },
  },

  components: {
    GoraSummary,
    ShipList,
    GoraImg,
  },

  methods: {
    closeDialog() {
      this.$emit('closeDialog')
    },

    unTagGorae() {
      this.tagPending = true;

      this.$store
        name = this.existingTagName

      this.$store.dispatch("meta/pokeRemTag", { tag: name, gorae: this.goraeSelected })
        .then((r) => {})
        .catch((e) => {})
        .finally(() => {
          this.tagPending = false;
          this.existingTagName = '';
        });
    },
  },

})
</script>


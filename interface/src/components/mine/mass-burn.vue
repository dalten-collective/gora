<template>
    <v-dialog v-model="dialogOpen" persistent scrollable>
      <v-card class="tw-bg-white">
        <v-card-title class="tw-flex tw-justify-between">
          <div></div>
          <div>
            Stack Gorae
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
                    Gorae to burn
                  </h2>
                </div>
                <div class="tw-flex tw-flex-col tw-flex-grow">
                  <GoraSummary
                    class="tw-border tw-rounded-sm tw-border-error tw-bg-white tw-p-2 tw-mb-2"
                    :goid="goid"
                    :key="goid"
                    v-for="goid in goraeSelected"
                  />
                </div>
              </div>

              <div class="tw-p-4 tw-border-gora tw-mb-6 tw-rounded-sm tw-shadow-inner">
                <div class="tw-mb-4 tw-text-center">
                  <h2 class="tw-text-success">
                    New Stacked Gora
                  </h2>
                </div>
                
                <div>
                  <v-select
                    label="Select Existing Gora"
                    :items="pitaSansChosen"
                    item-title="name"
                    item-value="id"
                    v-model="existingGoraID"
                  />
                </div>

                <div class="tw-flex tw-flex-col tw-flex-grow">
                  <v-form ref="mkGoraForm" v-model="mkGoraFormValid">
                    <v-text-field
                      v-model="goraName"
                      placeholder="This is My Gora. There Are Many Gorae Like It, But This One Is Mine"
                      :label="existingGoraID === '' ? 'New Gora Name' : 'Leave Blank - Existing Gora Selected'"
                      :rules="[(v) => !!v || existingGoraID !== '' || 'Required']"
                    />

                    <GoraImg :urlDirect="goraPic" v-if="goraPic" />

                    <v-text-field
                      v-model="goraPic"
                      placeholder="https://place-i-uploaded-my-image/the-image.jpg"
                      :label="existingGoraID === '' ? 'New Gora Image URL' : 'Leave Blank - Existing Gora Selected'"
                      :rules="[(v) => !!v || existingGoraID !== '' || 'Required']"
                    />
                    </v-form>
                </div>
              </div>

              <div class="tw-mb-4">
                <v-alert type="warning">
                  These gorae will be burned into the new, stacked gora. Hodlers of the original gorae will end up with x{{ goraeSelected.length }} of the new gora.
                </v-alert>
              </div>

              <div class="tw-flex tw-justify-end">
                <v-btn color="error" :loading="burnPending" block :disabled="burnPending || !burnReady" @click="burnGorae">BURN</v-btn>
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
    ...mapState("pita", ["pita"]),
    ...mapState("made", ["goraeSelected"]),
    pitaSansChosen(): Array<Gora> {
      return this.pita.filter((g: Gora) => {
        return !this.goraeSelected.includes(g.id)
      })
    },

    burnReady(): boolean {
      if (this.existingGoraID) {
        return true
      } else {
        if (this.goraName && this.goraPic) {
          return true
        }
      }
      return false
    },
  },

  data() {
    return {
      burnPending: false,
      goraName: "",
      goraPic: "",
      mkGoraFormValid: false,
      usingNew: true,
      existingGoraID: '',
    }
  },

  watch: {
    existingGoraID(val) {
      if (val) {
        this.goraName = '';
        this.goraPic  = '';
      }
    },
    goraName(val) {
      if (val) {
        this.existingGoraID = '';
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

    updateOurList(list) {
      this.offerList = list;
    },

    burnGorae() {
      this.burnPending = true;

      const burnToNew: NewBareGora = {
        dez: this.goraeSelected,
        which: {
          new: {
            name: this.goraName,
            pic: this.goraPic
          }
        }
      }
      const burnToExisting: Existing = {
        dez: this.goraeSelected,
        which: {
          existing: {
            id: this.existingGoraID
          }
        }
      }

      let payload
      if (this.existingGoraID === '') {
        payload = burnToNew
      } else {
        payload = burnToExisting
      }

      this.$store
        .dispatch("made/pokeStakGora", payload)
        .then((r) => {})
        .catch((e) => {})
        .finally(() => {
          this.burnPending = false;
          this.closeDialog()
        });
    },
  },

})
</script>


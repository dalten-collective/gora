<template>
  <div v-if="haveTheGora">
    <ul>
      <li v-for="k in Object.keys(theGora)" :key="k" class="tw-grid tw-grid-cols-12">
        <span class="tw-font-mono tw-grid-col-span-4">{{ k }}:</span>
        <span class="tw-grid-col-span-8">{{ theGora[k] }}</span>
      </li>
      <v-btn @click="showConfirmDelete = true;">Delete</v-btn>
    </ul>
  <v-dialog v-model="showConfirmDelete">
    <v-card class="tw-bg-white tw-p-4">
      <v-card-title>Delete Gora?</v-card-title>
      <v-card-text>
        Are you sure you want to delete this gora? TODO: explanation
      </v-card-text>
      <v-card-actions>
        <v-btn @click="showConfirmDelete = false;">No</v-btn>
        <v-btn @click="doDelete">Yes</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import type { PropType } from "vue";
import { GoraID, Gora, PokeRmGoraPayload } from '../../types';
import { mapState, mapGetters } from 'vuex'

export default defineComponent({
  props: {
    goid: {
      type: String as PropType<GoraID>,
      default: '0v0',
    },
  },

  data() {
    return {
      rmPending: false,
      showConfirmDelete: false,
    }
  },

  computed: {
    ...mapGetters("pita", ["goraByID"]),
    haveTheGora(): boolean {
      if (this.theGora) {
        return true
      }
      return false
    },
    theGora(): Gora {
      return this.goraByID(this.goid);
    },
  },

  methods: {
    doDelete() {
      this.rmPending = true;
      const payload: PokeRmGoraPayload = {
        id: this.goid
      }
      this.$store.dispatch("pita/pokeRmGora", payload)
        .then((r) => {
        })
        .catch((e) => {
        })
        .finally(() => {
          this.rmPending = false;
        })
    },
  },
})
</script>

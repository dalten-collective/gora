<template>
  <div>
    <div v-if="editing" class="tw-flex tw-items-center">
      <v-text-field
        class="tw-mr-2"
        v-model="newMax"
        label="Max Hodlers"
        hint="Limit how many ships can hold. Leave blank for unlimited. Set as 1 to create a unique gora"
        persistent-hint
        clearble
        :error-messages="errors"
        @keyup.enter="doUpdateMax"
      />
      <v-btn color="success" size="small" @click="doUpdateMax" :loading="updatePending" :disabled="updatePending">
        Save
      </v-btn>
      <v-btn variant="text" size="small" @click="editing = false;" :loading="updatePending" :disabled="updatePending">
        Cancel
      </v-btn>
    </div>

    <div v-else>
      <span v-if="!theGora.max">
        Unlimited
      </span>
      <span v-else>
        {{ theGora.max }}
      </span>
      <v-btn icon="mdi-pencil" class="tw-ml-2" variant="text" color="info" size="x-small" @click="editing = true;" />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { mapGetters } from "vuex";

export default defineComponent({
  props: {
    goid: {
      type: String,
    },
  },

  mounted() {
    this.newMax = this.theGora.max
  },

  watch: {
    haveTheGora(val, oldVal) {
      if (val) {
        this.newMax = this.theGora.max
      }
    },
  },

  data() {
    return {
      editing: false,
      updatePending: false,
      newMax: null,
      errors: [],
    }
  },

  computed: {
    ...mapGetters("pita", ["goraByID"]),

    haveTheGora(): boolean {
      if (this.theGora && this.theGora.hasOwnProperty('id')) {
        return true
      }
      return false
    },
    theGora(): Gora {
      return this.goraByID(this.goid);
    },
  },

  methods: {
    doUpdateMax() {
      this.updatePending = true;

      this.$store.dispatch('made/pokeSetMax', { id: this.goid, max: parseInt(this.newMax) })
        .then(() => {
          this.editing = false;
        })
        .catch(() => {
          this.errors = ["Cannot decrease the max!"]
          this.showError = true;
        })
        .finally(() => {
          this.updatePending = false;
        })
    },
  },
})
</script>

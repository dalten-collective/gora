<template>
  <div>
    <v-form ref="requestGoraForm" v-model="requestGoraFormValid">
      <v-text-field
        v-model="host"
        placeholder="~sampel-palnet"
        label="Ship"
      />
      <v-text-field
        v-model="goraID"
        placeholder="0v0.q3q..."
        label="Gora ID"
      />

      <v-btn color="success" @click="doRequestPoke" :loading="requestPending" :disabled="requestPending">Request</v-btn>
    </v-form>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { mapState } from "vuex";

import { Ship, GoraID, GoraIDShip } from "../../types";

export default defineComponent({
  data() {
    return {
      host: '' as Ship,
      goraID: '' as GoraID,
      requestGoraFormValid: false,
      requestPending: false,
    };
  },
  computed: {},
  methods: {
    resetRequest(): void {
      this.host = ""
      this.goraID = ""
      this.requestGoraFormValid = false
    },

    doRequestPoke() {
      this.requestPending = true;
      const payload: { id: GoraID, host: Ship } = {
        id: this.goraID,
        host: this.$filters.sigShip(this.host)
      }
      this.$store.dispatch("owned/pokeSendPlea", payload)
        .then((r) => {
        })
        .catch((e) => {
        })
        .finally(() => {
          this.requestPending = false;
          this.resetRequest()
        })
    },
  },

});
</script>


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
          <MkForm />
        </v-card-text>
      </v-card>
    </v-dialog>

    <header class="tw-mb-4 tw-text-xl">Mine</header>

    <div>
      <MyOneGora v-for="goid in made" :key="goid" :goid="goid" class="tw-mb-4"/>
    </div>

  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { mapState } from "vuex";
import MkForm from "@/components/mine/mk-form.vue"
import MyOneGora from "@/components/mine/my-one-gora.vue"

export default defineComponent({
  data() {
    return {
      making: false,
    }
  },

  computed: {
    ...mapState("made", ["made"]),
  },
  components: { MkForm, MyOneGora },
});
</script>

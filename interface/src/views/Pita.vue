<template>
  <div>
    <header class="tw-mb-4 tw-text-xl">Pita</header>
    <div>
      <PitaOneGora v-for="goid in pitaIDs" :key="goid" :goid="goid" class="tw-mb-4"/>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { mapGetters } from "vuex";
import PitaOneGora from "@/components/pita/pita-one-gora.vue"

export default defineComponent({
  computed: {
    ...mapGetters("pita", ["pitaIDs"]),
    // ...mapState("pita", ["pita"]),
  },
  components: {
    PitaOneGora,
  }
})
</script>


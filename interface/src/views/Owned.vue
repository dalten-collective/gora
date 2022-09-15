<template>
  <div>
    <header class="tw-my-4 tw-text-xl">Offered</header>

    <div v-if="offers.length > 0">
      <div v-for="goid in offers">
        offered gora: {{ goid }}
      </div>
    </div>

    <header class="tw-my-4 tw-text-xl">Owned</header>

    <div>
      <OwnedOneGora v-for="goid in owned" :key="goid" :goid="goid" class="tw-mb-4"/>
    </div>

  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { mapState } from "vuex";
import OwnedOneGora from "@/components/owned/owned-one-gora.vue"

export default defineComponent({
  data() {
    return {
      making: false,
    }
  },

  computed: {
    ...mapState("owned", ["owned"]),
    ...mapState("logs", ["offers"]),
  },
  components: { OwnedOneGora },
});
</script>

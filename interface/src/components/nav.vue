<template>
  <ul class="tw-flex tw-justify-between">
    <li v-for="(dest, i) in pageLinks" :key="dest.route" class="tw-flex-1" :class="edges(i)">
      <v-btn :variant="isActive(dest.route) ? 'tonal' : 'outlined'" color="surface" :to="{ name: dest.route }">
        {{ dest.name }}
      </v-btn>
    </li>
  </ul>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  data() {
    return {
      pageLinks: [
        {
          name: 'Goriverse',
          route: 'pita',
        },
        {
          name: 'Hedl',
          route: 'hedl',
        },
        {
          name: 'Mine',
          route: 'mine',
        },
      ]
    }
  },

  methods: {
    isActive(routeName) {
      return (this.$route.name === routeName)
    },

    edges(n) {
      if (n === 0) {
        return 'tw-text-left'
      }
      if (n === (this.pageLinks.length - 1)) {
        return 'tw-text-right'
      }
      return 'tw-text-center'
    },
  },

})
</script>


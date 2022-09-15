<template>
  <div>
    <header class="tw-mb-4 tw-text-xl">Owned</header>

    <v-text-field v-model="bucket" label="bucket" />
    <v-text-field v-model="key" label="key" />
    <v-text-field v-model="newSetting" label="new setting" />

    <v-btn @click="putSetting">put</v-btn>
    <v-btn @click="getAllSettings">get all settings</v-btn>
    <v-btn @click="getBucket">get bucket</v-btn>
    <pre>{{ result }}</pre>

    <div>
      <OwnedOneGora v-for="goid in owned" :key="goid" :goid="goid" class="tw-mb-4"/>
    </div>

  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { mapState } from "vuex";
import OwnedOneGora from "@/components/owned/owned-one-gora.vue"

import urbitAPI from '@/api/urbitAPI';
import { settings } from '@urbit/api'

export default defineComponent({
  data() {
    return {
      making: false,

      bucket: 'interface',
      result: '',
      newSetting: '',
      key: '',
    }
  },

  methods: {
    getBucket() {
      urbitAPI.scry(settings.getBucket('gora', this.bucket))
        .then(r => this.result = r)
    },

    getAllSettings() {
      console.log('getting')
      urbitAPI.scry(settings.getDeskSettings('gora')).then(r => this.result = r)
    },

    putSetting() {
      console.log('putting')
      urbitAPI.poke(settings.putEntry('gora', this.bucket, this.key, this.newSetting))
    },

  },

  computed: {
    ...mapState("owned", ["owned"]),
  },
  components: { OwnedOneGora },
});
</script>

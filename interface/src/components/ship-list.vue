<template>
  <div>
    <div class="tw-mb-4">
      <ul>
        <li v-for="ship in offerList" :key="ship">
          <div class="tw-grid tw-grid-cols-6 tw-gap-1">
            <div class="tw-col-span-3">
              <span class="tw-font-mono">{{ ship }}</span>
            </div>
            <div class="tw-col-span-2">
              <v-btn
                icon="mdi-close"
                size="x-small"
                variant="outline"
                color="error"
                @click="removeFromOfferList(ship)"
              />
            </div>
          </div>
        </li>
      </ul>
    </div>

    <div class="tw-flex tw-justify-around tw-items-center tw-mb-4">
      <div class="tw-flex-grow tw-mr-2">
        <v-text-field
          v-model="offerShip"
          placeholder="~sampel-palnet, ~palnet-sampel dister-dozzod-dalten"
          label="Hodlers"
          persistent-hint
        />
      </div>
      <div>
        <v-btn
          @click="addToOfferList"
          :disabled="!offerShip || shipValidate(offerShip) != true"
          icon="mdi-plus"
          color="info"
          @keyup.enter.prevent="addToOfferList(ship)"
        ></v-btn>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  data() {
    return {
      offerShip: "",
      offerList: [],
    };
  },

  methods: {
    shipValidate(string) {
      return !string || /^[\w~-\s,]+$/.test(string) || "invalid ships";
    },
    resetList() {
      this.offerList = [];
    },

    removeFromOfferList(ship) {
      this.offerList = this.offerList.filter((s: string) => s !== ship);
      this.$emit('updateList', this.offerList)
    },
    addToOfferList() {
      if (!this.offerShip) {
        return;
      }

      if (!this.offerList.includes(this.offerShip)) {
        // Split on commas and spaces
        const ships = this.offerShip.split(/,| /).filter((s) => s !== "");
        const shipSet = new Set(this.offerList);

        ships.forEach((s: string) => shipSet.add(this.$filters.sigShip(s)));
        this.offerList = Array.from(shipSet);

        // this.stackHodlers[this.gHodlAdd] = 1;
      }
      this.offerShip = "";
      this.$emit('updateList', this.offerList)
    },
  },
});
</script>

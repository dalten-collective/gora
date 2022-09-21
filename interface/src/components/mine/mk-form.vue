<template>
  <div class="tw-w-full md:tw-w-2/3 md:tw-mx-auto">
    <v-form ref="mkGoraForm" v-model="mkGoraFormValid">
      <v-text-field
        v-model="goraName"
        placeholder="This is My Gora. There Are Many Gorae Like It, But This One Is Mine"
        label="Name"
        required
        :rules="[(v) => !!v || 'Required']"
      />

      <GoraImg :urlDirect="goraPic" v-if="goraPic" />

      <v-text-field
        v-model="goraPic"
        placeholder="https://place-i-uploaded-my-image/the-image.jpg"
        label="Image URL"
        required
        :rules="[(v) => !!v || 'Required']"
      />

      <div class="tw-flex tw-items-center">
        <div>
          <v-switch
            hide-details
            v-model="isStak"
            color="info"
            label="Stackable"
          />
        </div>
        <div class="tw-ml-1 tw-mb-4">
          <v-btn icon color="secondary" variant="text" size="small">
            <v-icon> mdi-help-circle-outline </v-icon>
            <v-tooltip activator="parent" location="right">
              Hodlers of a stackable gora will be able to accumulate X instances
              of the token - useful "points", "size" or "occurances".
            </v-tooltip>
          </v-btn>
        </div>
      </div>

      <div>

        <div class="tw-mb-4">
          <!--
          <div v-if="gHodlAdd && gHodl.length == 0">
            haven't added yet
          </div>
          -->
          <ul>
            <li v-for="ship in gHodl" :key="ship">
              <div class="tw-grid tw-grid-cols-6 tw-gap-1">
                <div class="tw-col-span-3">
                  <span class="tw-font-mono">{{ ship }}</span>
                </div>
                <div class="tw-col-span-2">
                  <v-btn icon="mdi-close" size="x-small" variant="outline" color="error" @click="removeFromGHodl(ship)" />
                </div>
              </div>
            </li>
          </ul>
        </div>

        <div class="tw-flex tw-justify-around tw-items-center tw-mb-4">
          <div class="tw-flex-grow tw-mr-2">
            <v-text-field
              v-model="gHodlAdd"
              placeholder="~sampel-palnet, ~palnet-sampel dister-dozzod-dalten"
              label="Hodlers"
              persistent-hint
              :hint="
                holdersOverMax
                  ? 'Some of these ships won\'t be able to claim, due to Max'
                  : 'Optionally start this gora with outgoing offers.'
              "
              @keyup.enter="addToGHodl"
            />
          </div>
          <div>
            <v-btn @click="addToGHodl" :disabled="!gHodlAdd || shipValidate(gHodlAdd) != true" icon="mdi-plus" color="info"></v-btn>
          </div>
        </div>

        <div class="tw-mb-4">
          <v-text-field
            v-if="!isStak"
            v-model="gMax"
            placeholder=""
            label="Max Hodlers"
            hint="Limit how many ships can hold. Leave blank for unlimited. Set as 1 to create a unique gora"
          />
        </div>
      </div>

      <!--
      <div v-else>
        todo: stackers
        <pre>
        sh: {{ stackHodlers }}
        convert: {{ stackHodlersTosHodl }}
        </pre>
        <div>
          <ul>
            <li v-for="ship in gHodl" :key="ship">
              {{ ship }}
              <v-text-field v-model="stackHodlers[ship]" label="many" />
              <span @click="removeFromGHodl(ship)">Remove</span>
            </li>
          </ul>
        </div>
        <v-text-field
          v-model="gHodlAdd"
          placeholder="~sampel-palnet, "
          label="Hodlers"
          @keyup.enter="addToGHodl"
        />
        <v-btn @click="addToGHodl" :disabled="!gHodlAdd" icon="mdi-plus" color="info"></v-btn>

        <v-text-field v-model="gMax" placeholder="" label="Max Hodlers" />
      </div>
      -->

      <div class="tw-flex tw-justify-end">
        <v-btn
          color="success"
          :disabled="!mkGoraFormValid || makePending"
          :loading="makePending"
          @click="doMkPoke"
          >Mint</v-btn
        >
      </div>
    </v-form>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { mapState } from "vuex";

import GoraImg from "@/components/gora-img.vue";

import {
  PokeMkGoraPayload,
  NewGType,
  NewSType,
  Stackers,
  UrbNull,
  Ship,
} from "../../types";

export default defineComponent({
  data() {
    return {
      // for new
      makePending: false,
      goraName: "",
      goraPic: "",
      isStak: false,
      mkGoraFormValid: false,
      gHodlAdd: "",
      gHodl: [] as Array<string>,
      gMax: null,
      sHodl: [] as Array<Stackers>,
      stackHodlers: {},
      //
    };
  },
  computed: {
    ...mapState("made", ["made"]),

    stackHodlersTosHodl(): Array<Stackers> {
      // as just (set ship):
      // return this.gHodl

      // as <Stackers>
      return Object.keys(this.stackHodlers).map((ship: Ship) => {
        return {
          who: ship,
          has: this.stackHodlers[ship],
        };
      });
    },
    holdersOverMax() {
      return this.gMax && this.gHodl.length > this.gMax;
    },
  },

  components: { GoraImg },

  methods: {
    shipValidate(string) {
      return (!string || /^[\w~-\s,]+$/.test(string)) || "invalid ships"
    },

    addToGHodl() {
      if (!this.gHodlAdd) {
        return;
      }

      if (!this.gHodl.includes(this.gHodlAdd)) {
        // Split on commas and spaces
        const ships = this.gHodlAdd.split(/,| /).filter(s => s !== "")
        const shipSet = new Set(this.gHodl)

        ships.forEach((s: string) => shipSet.add(this.$filters.sigShip(s)))
        this.gHodl = Array.from(shipSet)

        // this.stackHodlers[this.gHodlAdd] = 1;
      }
      this.gHodlAdd = "";
    },
    removeFromGHodl(ship: string) {
      this.gHodl = this.gHodl.filter((s: string) => s !== ship);
    },

    maxToUrb(): UrbNull | number {
      if (this.gMax === null) {
        return null;
      }
      return parseInt(this.gMax);
    },

    stakToType(): NewGType | NewSType {
      if (this.isStak) {
        return {
          s: {
            stak: this.gHodl,
            // stak: this.stackHodlersTosHodl,
          },
        };
      } else {
        return {
          g: {
            hodl: this.gHodl,
            max: this.maxToUrb(),
          },
        };
      }
    },

    newShape(): PokeMkGoraPayload {
      return {
        name: this.goraName,
        pic: this.goraPic,
        type: this.stakToType(),
      };
    },

    resetNew(): void {
      this.goraName = "";
      this.goraPic = "";
      this.isStak = false;
      this.mkGoraFormValid = false;
      this.gHodlAdd = "";
      this.gHodl = [] as Array<string>;
      this.gMax = null;
      this.sHodl = [] as Array<Stackers>;
    },

    doMkPoke() {
      this.makePending = true;
      if (this.gHodlAdd) {
        this.addToGHodl();
      }

      this.$store
        .dispatch("made/pokeMkGora", this.newShape())
        .then((r) => {})
        .catch((e) => {})
        .finally(() => {
          this.makePending = false;
          this.resetNew();
          this.$emit("closeMk");
        });
    },
  },
});
</script>

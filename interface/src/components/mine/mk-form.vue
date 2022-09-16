<template>
  <div>
    <v-form ref="mkGoraForm" v-model="mkGoraFormValid">
      <v-text-field
        v-model="goraName"
        placeholder="This is My Gora. There Are Many Gorae Like It, But This One Is Mine"
        label="Name"
      />
      <v-text-field
        v-model="goraPic"
        placeholder="https://place-i-uploaded-my-image/the-image.jpg"
        label="Image URL"
      />


      <v-switch v-model="isStak" color="info" label="Stackable?" />

      <div v-if="!isStak">
        <div>
          <ul>
            <li v-for="ship in gHodl" :key="ship">
              {{ ship }}
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
        <v-btn @click="addToGHodl">Add</v-btn>

        <v-text-field
          v-model="gMax"
          placeholder=""
          label="Max Hodlers"
        />
      </div>

      <div v-else>
        todo: stackers
        <pre>
        sh: {{ stackHodlers}}
        convert: {{ stackHodlersTosHodl }}
        </pre>
        <div>
          <ul>
            <li v-for="ship in gHodl" :key="ship">
              {{ ship }}
              <v-text-field v-model="stackHodlers[ship]" label="many"/>
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
        <v-btn @click="addToGHodl">Add</v-btn>

        <v-text-field
          v-model="gMax"
          placeholder=""
          label="Max Hodlers"
        />
      </div>

      <v-btn color="success" @click="doMkPoke">Create</v-btn>
    </v-form>
    <pre>new: {{ newShape() }}</pre>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { mapState } from "vuex";

import { PokeMkGoraPayload, NewGType, NewSType, Stackers, UrbNull, Ship } from "../../types";

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
          has: this.stackHodlers[ship]
        }
      })
    },
  },
  components: {},

  methods: {
    addToGHodl() {
      if (!this.gHodlAdd) {
        return;
      }

      if (!this.gHodl.includes(this.gHodlAdd)) {
        this.gHodl.push(this.gHodlAdd)
        this.stackHodlers[this.gHodlAdd] = 1;
      }
      this.gHodlAdd = "";
    },
    removeFromGHodl(ship: string) {
      this.gHodl = this.gHodl.filter((s: string) => s !== ship)
    },

    maxToUrb(): UrbNull | number {
      if (this.gMax === null) {
        return null
      }
      return parseInt(this.gMax)
    },

    stakToType(): NewGType | NewSType {
      if (this.isStak) {
        return {
          s: {
            stak: this.stackHodlersTosHodl,
          }
        }
      } else {
        return {
          g: {
            hodl: this.gHodl,
            max: this.maxToUrb()
          }
        }
      }
    },

    newShape(): PokeMkGoraPayload {
      return {
        name: this.goraName,
        pic: this.goraPic,
        type: this.stakToType(),
      }
    },

    resetNew(): void {
      this.goraName = ""
      this.goraPic = ""
      this.isStak = false
      this.mkGoraFormValid = false
      this.gHodlAdd = ""
      this.gHodl = [] as Array<string>
      this.gMax = null
      this.sHodl = [] as Array<Stackers>
    },

    doMkPoke() {
      this.makePending = true;
      this.$store.dispatch("made/pokeMkGora", this.newShape())
        .then((r) => {
        })
        .catch((e) => {
        })
        .finally(() => {
          this.makePending = false;
          this.resetNew()
        })
    },
  },

});
</script>


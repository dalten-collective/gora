<template>
  <div v-if="haveTheGora">
    <div
      class="tw-p-3 tw-rounded-md tw-shadow-md tw-border-2 tw-border-info tw-border-opacity-25"
    >
      <article>
        <div class="tw-flex tw-flex-col">
          <div class="tw-flex tw-justify-start">
            <div style="position: relative" v-if="thisGoraPub(goid)">
              <v-tooltip position="left">
                <template v-slot:activator="{ props }">
                  <v-icon
                    v-bind="props"
                    style="position: absolute; top: 10px; left: 10px"
                    variant="outlined"
                  >
                    mdi-eye
                  </v-icon>
                </template>
                <span> Public </span>
              </v-tooltip>
            </div>

          </div>

          <div>
            <router-link
              :to="{ name: 'mine-gora-detail', params: { goraID: goid } }"
            >
              <GoraImg :gora="theGora" />
            </router-link>
          </div>

          <div class="tw-class-flex tw-justify-space-around">
            <div class="tw-max-w-[250px] tw-flex tw-justify-between tw-mt-1">
                <div>
                  <div v-if="cultsAroundGora(goid).length > 0">
                    <v-tooltip location="bottom">
                      <template v-slot:activator="{ props }">
                        <v-icon
                          color="gray"
                          v-bind="props"
                        >
                          mdi-castle
                        </v-icon>
                      </template>
                      <span> Has a cult </span>
                    </v-tooltip>
                  </div>
                </div>

              <h1
                class="tw-text-center"
                style="
                  white-space: nowrap;
                  width: 250px;
                  overflow: hidden;
                  text-overflow: ellipsis;
                "
              >
                {{ theGora.name }}
                <v-tooltip activator="parent" location="bottom">
                  {{ theGora.name }}
                </v-tooltip>
              </h1>

                <div>
                  <div v-if="sType">
                    <v-tooltip location="bottom">
                      <template v-slot:activator="{ props }">
                        <v-icon
                          color="warning"
                          v-bind="props"
                        >
                          mdi-circle-multiple-outline
                        </v-icon>
                      </template>
                      <span> Stak </span>
                    </v-tooltip>
                  </div>
                </div>

            </div>
          </div>
        </div>

        <footer class="tw-flex tw-justify-between tw-min-h-[32px]">
          <div>
            <v-checkbox v-model="innerSelected" />
          </div>
          <router-link
            :to="{ name: 'mine-gora-detail', params: { goraID: goid } }"
          >
            <v-btn
              icon="mdi-pencil"
              variant="outline"
              color="info"
              size="x-small"
            />
          </router-link>
        </footer>

        <footer v-if="innerSelected">
          <div class="tw-flex tw-flex-wrap tw-max-w-[250px]">
            <v-chip
              v-for="t in tagsForGora"
              :key="t"
              class="tw-mr-1 tw-mb-1"
              variant="outlined"
              color="info"
              size="small"
            >
              <v-icon class="tw-mr-1"> mdi-tag-outline </v-icon>
              {{ t }}
            </v-chip>
          </div>
        </footer>
      </article>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import type { PropType } from "vue";
import { GoraID, Gora, PokeRmGoraPayload, GoraIDShip } from "../../types";

import { mapState, mapGetters } from "vuex";

import Outgoing from "@/components/mine/outgoing.vue";
import GoraImg from "@/components/gora-img.vue";

export default defineComponent({
  props: {
    goid: {
      type: String as PropType<GoraID>,
      default: "0v0",
    },
  },

  data() {
    return {
      rmPending: false,
      showConfirmDelete: false,
      transactPending: false,
      recipients: [] as Array<Ship>,
      recipientAdd: "",
      offerPending: false,
      innerSelected: false,
    };
  },

  mounted() {
    this.innerSelected = this.goraIsSelected(this.goid);
  },

  watch: {
    innerSelected(val) {
      if (val) {
        this.$store.dispatch("made/selectGora", this.goid);
      } else {
        this.$store.dispatch("made/deselectGora", this.goid);
      }
    },

    isSelected(val) {
      if (val) {
        this.innerSelected = true;
      } else {
        this.innerSelected = false;
      }
    },
  },

  computed: {
    ...mapGetters("pita", ["goraByID"]),
    ...mapState("logs", ["requests", "outgoing"]),
    ...mapGetters("logs", ["requestsForID", "outgoingFor"]),
    ...mapGetters("made", ["goraIsSelected"]),
    ...mapGetters("meta", ["thisGoraTags", "thisGoraPub"]),
    ...mapGetters("cult", ["cultsAroundGora"]),

    gType(): boolean {
      return this.haveTheGora && this.theGora.hasOwnProperty("hodl");
    },
    sType(): boolean {
      return this.haveTheGora && this.theGora.hasOwnProperty("stak");
    },

    tagsForGora() {
      return this.thisGoraTags(this.goid).map((t) => t.tag);
    },

    isSelected() {
      return this.goraIsSelected(this.goid);
    },

    requestsByID() {
      return this.requestsForID(this.goid);
    },
    outgoingByID() {
      return this.outgoingFor(this.goid);
    },

    haveTheGora(): boolean {
      if (this.theGora) {
        return true;
      }
      return false;
    },
    theGora(): Gora {
      return this.goraByID(this.goid);
    },
  },

  methods: {
    boxChecked() {
      this.$emit("boxChecked", { goraID: this.goid });
    },

    addToRecipients() {
      if (!this.recipientAdd) {
        return;
      }

      if (!this.recipients.includes(this.recipientAdd)) {
        this.recipients.push(this.recipientAdd);
      }
      this.recipientAdd = "";
    },

    removeFromRecipients(ship: string) {
      this.recipients = this.recipients.filter((s: string) => s !== ship);
    },

    doOffer() {
      this.offerPending = true;
      this.$store
        .dispatch("made/pokeGiveGora", { id: this.goid, who: this.recipients })
        .then((r) => {})
        .catch((e) => {})
        .finally(() => {
          this.offerPending = false;
          this.resetOffer();
        });
    },

    resetOffer() {
      this.recipients = [];
    },

    doDelete() {
      this.rmPending = true;
      const payload: PokeRmGoraPayload = {
        id: this.goid,
      };
      this.$store
        .dispatch("pita/pokeRmGora", payload)
        .then((r) => {})
        .catch((e) => {})
        .finally(() => {
          this.rmPending = false;
        });
    },

    acceptRequest(ship) {
      this.transactPending = true;
      const payload: GoraIDShip = {
        id: this.goid,
        ship,
      };
      this.$store
        .dispatch("made/pokeAcceptRequest", payload)
        .then((r) => {})
        .catch((e) => {})
        .finally(() => {
          this.transactPending = false;
        });
    },

    ignoreRequest(ship) {
      this.transactPending = true;
      const payload: GoraIDShip = {
        id: this.goid,
        ship,
      };
      this.$store
        .dispatch("made/pokeIgnoreRequest", payload)
        .then((r) => {})
        .catch((e) => {})
        .finally(() => {
          this.transactPending = false;
        });
    },
  },

  components: {
    Outgoing,
    GoraImg,
  },
});
</script>

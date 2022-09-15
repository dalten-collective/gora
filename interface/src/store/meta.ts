import { PublicState, PolicyState, TagsState } from "@/types";

export default {
  namespaced: true,
  state() {
    return {
      haveMeta: false,
      public: [] as PublicState,
      policy: [] as PolicyState,
      tags: [] as TagsState,
    };
  },

  getters: {
  },

  mutations: {
    setPublic(state, payload: PublicState) {
      state.public = payload;
    },
    setPolicy(state, payload: PolicyState) {
      state.policy = payload;
    },
    setTags(state, payload: TagsState) {
      state.tags = payload;
    },
    haveMeta(state) {
      state.haveMeta = true;
    },
  },

  actions: {
    haveMeta({ commit }) {
      commit('haveMeta')
    },

    handleSubscriptionData(
      { commit, dispatch },
      payload: {
        public: PublicState;
        policy: PolicyState;
        tags: TagsState;
      }
    ) {
      console.log("in meta ", payload);

      commit("setPublic", payload.public);
      commit("setPolicy", payload.policy);
      commit("setTags", payload.tags);
    },
  },
};

import airlock from "../api";

import { AgentSubscription, DiffResponse, InitResponse } from "@/types";

export default {
  namespaced: true,
  state() {
    return {
      haveSubscription: false,
      subscriptions: [] as Array<AgentSubscription>,
    };
  },

  getters: {
    agentSubscriptions(state): Array<AgentSubscription> | [] {
      return state.subscriptions;
    },
  },

  mutations: {
    addSubscription(state, payload: AgentSubscription) {
      state.subscriptions.push(payload);
    },

    unsetSubscription(state, subscription: AgentSubscription) {
      const sub = state.subscriptions.find((s) => s === subscription);
      state.subscriptions = state.subscriptions.filter((s) => s != sub);
    },

    haveSubscription(state) {
      state.haveSubscription = true;
    },
  },

  actions: {
    openAirlockToAgent({ commit, dispatch }, agentName: string) {
      airlock.openAirlockTo(
        agentName,
        (data) => {
          commit("haveSubscription")
          if (data.hasOwnProperty('diff')) {
             dispatch("made/handleDiff", data, { root: true })
             dispatch("pita/handleDiff", data, { root: true })
             dispatch("owned/handleDiff", data, { root: true })
             dispatch("logs/handleDiff", data, { root: true })
             dispatch("meta/handleDiff", data, { root: true })
          } else {
            // initial response
            dispatch("pita/handleSubscriptionData", data.pita, { root: true })
              .then(() => commit('pita/havePita', {}, { root: true }));
            dispatch("owned/handleSubscriptionData", data.owned, { root: true });
            dispatch("made/handleSubscriptionData", data.made, { root: true });
            dispatch(
              "meta/handleSubscriptionData",
              { public: data.public, policy: data.policy, tags: data.tags },
              { root: true }
            )
              .then(() => commit('meta/haveMeta', {}, { root: true }));
            dispatch("logs/handleSubscriptionData", data.logs, { root: true })
              .then(() => commit('logs/haveLogs', {}, { root: true }));
          }
        },
        (subscriptionNumber: number) => {
          dispatch("addSubscription", {
            agentName,
            subscriptionNumber,
          } as AgentSubscription);
        }
      );
    },

    removeSubscription({ commit }, subscription: AgentSubscription) {
      commit("unsetSubscription", subscription);
    },

    addSubscription({ state, commit, dispatch }, payload: AgentSubscription) {
      const existing:
        | Array<AgentSubscription>
        | [] = state.subscriptions.filter((s: AgentSubscription) => {
        return s.agentName === payload.agentName;
      });
      existing.forEach((sub) => {
        dispatch("removeSubscription", sub);
      });
      commit("addSubscription", payload);
    },

    closeAgentAirlocks({ commit, getters }) {
      const agentSubscriptions: Array<AgentSubscription> | [] =
        getters.agentSubscriptions;
      agentSubscriptions.forEach((sub) => {
        airlock.closeAirlock(sub.subscriptionNumber, [
          commit("unsetSubscription", sub),
        ]);
      });
    },
  },
};

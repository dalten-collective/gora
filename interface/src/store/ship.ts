import airlock from "../api";

import { AgentSubscription, DiffResponse, InitResponse } from "@/types";

export default {
  namespaced: true,
  state() {
    return {
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
  },

  actions: {
    openAirlockToAgent({ dispatch }, agentName: string) {
      airlock.openAirlockTo(
        agentName,
        (data: InitResponse | DiffResponse) => {
          console.log("agentName ", agentName);
          console.log("response ", data);

          if ('diff' in data) {
            // TODO: handle diffs
            console.log('got a diff')
            console.log('diff: ', data.diff)
            // add
              dispatch("pita/handleDiff", data, { root: true })
              dispatch("made/handleDiff", data, { root: true })
          } else {
            // initial response
            console.log('got an init')
            dispatch("pita/handleSubscriptionData", data.pita, { root: true });
            dispatch("owned/handleSubscriptionData", data.owned, { root: true });
            dispatch("made/handleSubscriptionData", data.made, { root: true });
            dispatch(
              "meta/handleSubscriptionData",
              { public: data.public, policy: data.policy, tags: data.tags },
              { root: true }
            );
          }
        },
        (subscriptionNumber: number) => {
          console.log("got subscription number ", subscriptionNumber);
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

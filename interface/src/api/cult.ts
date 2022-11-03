import urbitAPI from "./urbitAPI";

import {
} from "@/types";

const CULT_MARK = "cult-dead";

export function getCults(): Promise<any> {
  return urbitAPI
    .scry({
      app: "gora",
      path: "/~/cult/state",
    })
    .then((r) => {
      return r;
    })
    .catch((e) => {
      console.log("err ", e);
      throw e;
    });
}

export function openCultlock(
  onEvent,
  onSubNumber
) {
  urbitAPI
    .subscribe({
      app: "gora",
      path: "/~/augury",
      event: (data) => {
        onEvent(data)
      },
    })
    .then((sub: number) => {
      onSubNumber(sub);
    });
}

export function mkCult(payload: { id: GoraID, groupName: string }): Promise<any> {
  // TODO: groupName should be an array of @tas
  const json = {
    "add": {
      id: payload.id,
      group: payload.groupName,
    },
  };

  return urbitAPI
    .poke({
      app: "gora",
      mark: CULT_MARK,
      json,
    })
    .then((r) => {
      return r;
    })
    .catch((e) => {
      console.log("err ", e);
      throw e;
    });
}

export function rmCult(payload: { id: GoraID }): Promise<any> {
  // TODO: groupName should be an array of @tas
  const json = {
    "del": {
      id: payload.id,
    },
  };

  return urbitAPI
    .poke({
      app: "gora",
      mark: CULT_MARK,
      json,
    })
    .then((r) => {
      return r;
    })
    .catch((e) => {
      console.log("err ", e);
      throw e;
    });
}



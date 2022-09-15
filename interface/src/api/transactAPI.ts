import urbitAPI from "./urbitAPI";

import {
  PokeAcceptGive,
  PokeIgnoreGive,
  GoraID,
} from "@/types";

const manMark = "gora-man-2";
// const transMark = "gora-transact-2"

export function acceptGive(payload: { id: GoraID }): Promise<any> {
  const json: PokeAcceptGive = {
    "accept-give": payload,
  };
  return urbitAPI
    .poke({
      app: "gora",
      mark: manMark,
      json,
    })
    .then((r) => {
      console.log("res ", r);
      return r;
    })
    .catch((e) => {
      console.log("err ", e);
      throw e;
    });
}

export function ignoreGive(payload: { id: GoraID }): Promise<any> {
  const json: PokeIgnoreGive = {
    "ignore-give": payload,
  };
  return urbitAPI
    .poke({
      app: "gora",
      mark: manMark,
      json,
    })
    .then((r) => {
      console.log("res ", r);
      return r;
    })
    .catch((e) => {
      console.log("err ", e);
      throw e;
    });
}

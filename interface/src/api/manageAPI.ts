import urbitAPI from "./urbitAPI";

import {
  GoraID,
  NewBareGora,
  PokeMkGora,
  PokeMkGoraPayload,
  PokeRmGora,
  PokeRmGoraPayload,
  PokeSendGora,
  PokeStakEm,
} from "@/types";

const manMark = "gora-man-2";
// const transMark = "gora-transact-2"

export function mkGora(payload: PokeMkGoraPayload): Promise<any> {
  const json: PokeMkGora = {
    "mk-gora": payload,
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

export function stakEm(payload: { dez: Array<GoraID>, which: GoraID | NewBareGora }): Promise<any> {
  const json: PokeStakEm = {
    "stak-em": payload,
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

export function sendGive(payload: { id: GoraID, who: Array<Ship> }): Promise<any> {
  const json: PokeSendGora = {
    "send-gora": payload,
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


export function rmGora(payload: PokeRmGoraPayload): Promise<any> {
  const json: PokeRmGora = {
    "rm-gora": payload,
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

import urbitAPI from "./urbitAPI";

import {
  PokeMkGora,
  PokeMkGoraPayload,
  PokeRmGora,
  PokeRmGoraPayload,
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

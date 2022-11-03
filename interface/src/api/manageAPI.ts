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
  PokeSetMax,
  PokeAddTag,
  PokeRemTag,
  Existing,
  PokePubMod,
} from "@/types";
import {useCssVars} from "vue";

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
      return r;
    })
    .catch((e) => {
      console.log("err ", e);
      throw e;
    });
}

export function rmGora(payload: PokeRmGoraPayload): Promise<any> {
  const json: PokeRmGora = {
    "rm-gora": payload
  };
  return urbitAPI
    .poke({
      app: "gora",
      mark: manMark,
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

export function rmGora(payload: PokeRmGoraPayload): Promise<any> {
  const json: PokeRmGora = {
    "rm-gora": payload
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

export function setMax(payload: { id: GoraID, max: UrbNull | number }): Promise<any> {
  const json: PokeSetMax = {
    "set-max": payload,
  };
  return urbitAPI
    .poke({
      app: "gora",
      mark: manMark,
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


export function stakEm(payload: {
  dez: GoraID,
  which: NewBareGora | Existing
}): Promise<any> {
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
      return r;
    })
    .catch((e) => {
      console.log("err ", e);
      throw e;
    });
}

export function addTag(payload: { tag: string, gorae: Array<GoraID> }): Promise<any> {
  const json: PokeAddTag = {
    "add-tag": payload,
  };
  return urbitAPI
    .poke({
      app: "gora",
      mark: manMark,
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

export function remTag(payload: { tag: string, gorae: Array<GoraID> }): Promise<any> {
  const json: PokeRemTag = {
    "rem-tag": payload,
  };
  return urbitAPI
    .poke({
      app: "gora",
      mark: manMark,
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

export function pubMod(payload: { id: GoraID, how: boolean }): Promise<any> {
  const json: PokePubMod = {
    "pub-gor": payload,
  };
  return urbitAPI
    .poke({
      app: "gora",
      mark: manMark,
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

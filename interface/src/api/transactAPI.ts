import urbitAPI from "./urbitAPI";

import {
  PokeAcceptGive,
  PokeIgnoreGive,
  GoraID,
  PokeSendPlea,
  Ship,
  GoraIDShip,
  PokeAcceptRequest,
  PokeIgnoreRequest,
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

export function sendPlea(payload: { id: GoraID, host: Ship }): Promise<any> {
  const json: PokeSendPlea = {
    "send-plea": payload,
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

export function acceptRequest(payload: GoraIDShip): Promise<any> {
  const json: PokeAcceptRequest = {
    "accept-request": payload,
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

export function ignoreRequest(payload: GoraIDShip): Promise<any> {
  const json: PokeIgnoreRequest = {
    "ignore-request": payload,
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

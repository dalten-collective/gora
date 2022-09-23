// Airlock concerns

export interface AgentSubscription {
  agentName: string;
  subscriptionNumber: number;
}

// Basic Gora types

export type GoraID = string;
export type GType = 'g';
export type SType = 's';
export type GoraType = GType | SType;
export type UrbNull = '~' | null;
export type Ship = string;
export type Gora = GoraStak | GoraG;
export interface Stackers {
  who: Ship;
  has: number;
}

export interface GoraG {
  type: GType;
  pic: string;
  name: string;
  made: number;
  id: GoraID;
  host: Ship;
  max: UrbNull | number;
  hodl: Array<Ship>;
}

export interface GoraStak {
  type: SType;
  pic: string;
  name: string;
  made: number;
  id: GoraID;
  host: Ship;
  stak: Array<Stackers>;
  nul: UrbNull | Array<GoraG>
}

export interface NewBareGora {
  name: string;
  pic: string;
}

export type Policy = boolean; // true == auto-approve; false == auto-reject;
export interface Policied {
  id: GoraID;
  policy: Policy;
}

export interface GoraIDShip {
  id: GoraID;
  ship: Ship;
}

export interface Request {
  requester: Ship;
  'id-list': Array<GoraID>;
}

export type Act = 'give' | 'take' | 'gack';

export interface Outgoing {
  when: number;
  id: GoraID;
  who: Ship;
  act: Act;
  status: UrbNull | boolean;
}

export type Tag = string;
export interface Tagged {
  tag: Tag;
  'id-list': Array<GoraID>;
}

// Backend responses

export type PitaState = Array<Gora>;
export type OwnedState = Array<GoraID>;
export type MadeState = Array<GoraID>;
export type PublicState = Array<GoraID>;
export type PolicyState = Array<Policied>;
export type TagsState = Array<Tagged>;

export interface LogsState {
  offers: Array<GoraID>;
  requests: Array<Request>;
  outgoing: Array<Outgoing>;
}

export interface GoraState {
  pita: PitaState;
  owned: OwnedState;
  made: MadeState;
  public: PublicState;
  policy: PolicyState;
  tags: TagsState;
  logs: LogsState;
}

// TODO: remove
export interface PartialGoraState {
  pita: PitaState;
  owned: OwnedState;
  made: MadeState;
  public: PublicState;
  policy: PolicyState;
  tags: TagsState;
  logs: LogsState;
}

export interface DiffObj {
  set: PartialGoraState;
  rem: PartialGoraState;
}

// Initial and all diffs

export type InitResponse = GoraState;

export interface DiffResponse {
  diff: DiffObj;
}

// Poke payloads

// interacting with gora

// [%ignore-give @uv]             ignores a given gorae
export interface PokeIgnoreGive {
  'ignore-give': { id: GoraID };
}

// [%accept-give @uv]             accepts a given gorae
export interface PokeAcceptGive {
  'accept-give': { id: GoraID };
}

// [%ignore-request @uv @p]       ignore pleas for gora
export interface PokeIgnoreRequest {
  'ignore-request': {
    id: GoraID;
    ship: Ship;
  };
}

// [%accept-request @uv @p]       accept pleas for gora
export interface PokeAcceptRequest {
  'accept-request': {
    id: GoraID;
    ship: Ship;
  };
}

// [%send-gora @uv (set ship)]    give a gora to people
export interface PokeSendGora {
  'send-gora': {
    id: GoraID;
    who: Array<Ship>;
  };
}

// [%send-plea @uv @p]            ask ship for gora @uv
export interface PokeSendPlea {
  'send-plea': {
    id: GoraID;
    host: Ship;
  };
}

// [%kick ~]                      maybe gora is naughty
// TODO:

// making and changing gorae

// [%rm-gora @uv]                               deletes a gora, local or remote
export interface PokeRmGoraPayload {
  id: GoraID;
}
export interface PokeRmGora {
  'rm-gora': PokeRmGoraPayload;
}

// [%set-max @uv (unit @ud)]                    sets max hodlers, gora-standard
export interface PokeSetMax {
  'set-max': {
    id: GoraID;
    max: UrbNull | number;
  };
}

// [%add-tag @tas (set id)]                     adds a tag across a set of gora
export interface PokeAddTag {
  'add-tag': {
    tag: string;
    gorae: Array<GoraID>;
  };
}

// [%rem-tag @tas (set id)]                     remove a tag from a set of gora
export interface PokeRemTag {
  'rem-tag': {
    tag: string;
    gorae: Array<GoraID>;
  };
}


export interface Existing {
  existing: GoraID
}

export interface NewStacked {
  new: NewBareGora;
}

// [%stak-em (set id) @t @t]                    convert a set gorae into a stak
export interface PokeStakEm {
  'stak-em': {
    dez: Array<GoraID>;
    which: Existing | NewBareGora;
  };
}
//
// [%pub-gor id how:bool]                    convert a set gorae into a stak
export interface PokePubMod {
  'pub-gor': {
    id: GoraID;
    how: boolean;
  };
}

// [%set-pol @uv u?(%approve %decline)]         (un)set a gora's request policy
export interface PokeSetPol {
  'set-pol': {
    id: GoraID;
    pol: UrbNull | Policy;
  };
}

export interface GTypeScaffold {
  hodl: Array<Ship>;
  max: UrbNull | number;
}
export interface STypeScaffold {
  stak: Array<Stackers>;
}

export interface NewGType {
  g: GTypeScaffold
}
export interface NewSType {
  s: STypeScaffold
}

// [%mk-gora @t @t ?([%g hodl max] [%s stak])]  start a new gora with hodl/stak
export interface PokeMkGoraPayload {
  name: string;
  pic: string;
  type: NewGType | NewSType;
}
export interface PokeMkGora {
  'mk-gora': PokeMkGoraPayload
}

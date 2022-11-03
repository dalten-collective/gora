import urbitAPI from "./urbitAPI";
import * as manageAPI from "./manageAPI";
import * as transactAPI from "./transactAPI";
import * as airlock from "./airlock";
import * as cultAPI from "./cult";

export default {
  ...urbitAPI,
  ...airlock,
  ...manageAPI,
  ...transactAPI,
  ...cultAPI,
};

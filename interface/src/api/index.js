import urbitAPI from "./urbitAPI";
import * as manageAPI from "./manageAPI";
import * as airlock from "./airlock";

export default {
  ...urbitAPI,
  ...airlock,
  ...manageAPI,
};

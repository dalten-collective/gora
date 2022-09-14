import urbitAPI from "./urbitAPI";
import * as madeAPI from "./madeAPI";
import * as airlock from "./airlock";

export default {
  ...urbitAPI,
  ...airlock,
  ...madeAPI,
};

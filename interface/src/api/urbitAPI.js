// import UrbitInterface from "@urbit/http-api"; // for typescript
import connector from "@urbit/http-api";

const urbitAPI = new connector("", "");
urbitAPI.ship = window.ship;

export default urbitAPI;

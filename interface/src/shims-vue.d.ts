/* eslint-disable */
declare module '*.vue' {
  //import Vue from 'vue'
  //export default Vue
  import type { DefineComponent } from 'vue'
  const component: DefineComponent<{}, {}, any>
  export default component
}

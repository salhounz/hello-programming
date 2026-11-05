import { render } from "solid-js/web";

function Hello() {
  return <h1>Hello, World!</h1>;
}

render(() => <Hello />, document.getElementById("root")!);

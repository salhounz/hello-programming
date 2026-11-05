# Angular

## Concise introductory examples

[examples.ts](./examples.ts) introduces a typed standalone component, records, arrays, methods, a getter, property/event binding, interpolation, and built-in `@for`/`@empty` control flow.

Use an existing Angular 17+ CLI application with dependencies installed. Copy the file to `src/app/examples.ts`. In the existing standalone root component, import `ExamplesComponent` from `"./examples"`, add it to the component's `imports` array, and put `<app-examples />` in its template. From that application's root run `npm start` (the standard CLI script for `ng serve`), then open `http://localhost:4200`. Toggle checkboxes to change the list. No FormsModule or CommonModule is needed for this example.

Angular is a full web application framework for component-based TypeScript applications. It includes routing, forms, dependency injection, and build tooling.

## Example

`hello.ts` defines a standalone component whose template renders the greeting.

Use: Add [hello.ts](./hello.ts) to an Angular application, import `HelloComponent`, and render its `app-hello` selector.

Learn more in the [Angular documentation](https://angular.dev/overview).

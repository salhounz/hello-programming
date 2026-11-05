# Express

## Concise introductory examples

[examples.js](./examples.js) introduces values, functions, arrays, filtering, middleware, route parameters, query strings, validation, JSON responses, and HTTP status codes.

Use an existing Node.js 18+ project with Express 4 or 5 already installed. Copy the file into that project as `examples.cjs` so CommonJS works even in a project using `"type": "module"`. From its root run `node examples.cjs`. Open `http://127.0.0.1:3000/books`, `http://127.0.0.1:3000/books?unread=true`, and `http://127.0.0.1:3000/books/2`. Try `/books/99` for 404 and `/books/nope` for 400. Keep port 3000 free and stop with Ctrl+C; the example only reads in-memory records.

Express is a minimal Node.js web framework for routing, middleware, and HTTP services. It is a useful foundation for APIs and server-rendered applications.

## Example

Install Express with `npm install express`, then run:

Run: `node hello.js`

Learn more in the [Express documentation](https://expressjs.com/).

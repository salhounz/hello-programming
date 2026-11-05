# HTMX

## Concise introductory examples

[examples.html](./examples.html) introduces HTML comments, form values, GET requests, targets, swaps, loading indicators, and server-rendered collections. Filtering and decisions belong to the backend; HTMX attributes do not declare language functions.

Use Node.js 18+ for this optional local host, with no packages. Save the following as `host.cjs` beside the example, then run `node host.cjs` from this directory. Open `http://127.0.0.1:3000` and search for `web`, an unmatched title, or an empty query. Keep port 3000 free; stop with Ctrl+C. The browser needs internet access to load HTMX from the CDN. The form also navigates to the results when JavaScript is unavailable.

```javascript
const http = require("node:http");
const fs = require("node:fs");
const path = require("node:path");
const page = fs.readFileSync(path.join(__dirname, "examples.html"));
const titles = ["Web basics", "Useful scripts"];
const escapeHtml = (text) => text.replace(/[&<>"']/g, (char) => ({
  "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;"
}[char]));
http.createServer((request, response) => {
  const url = new URL(request.url, "http://127.0.0.1:3000");
  response.setHeader("Content-Type", "text/html; charset=utf-8");
  if (url.pathname === "/") return response.end(page);
  if (url.pathname === "/books") {
    const query = (url.searchParams.get("q") ?? "").toLowerCase();
    const matches = titles.filter((title) => title.toLowerCase().includes(query));
    const html = matches.length
      ? "<ul>" + matches.map((title) => `<li>${escapeHtml(title)}</li>`).join("") + "</ul>"
      : "<p>No books found.</p>";
    return response.end(html);
  }
  response.statusCode = 404;
  response.end("<p>Not found.</p>");
}).listen(3000, "127.0.0.1", () => console.log("http://127.0.0.1:3000"));
```

The host returns HTML fragments for HTMX swaps. Without JavaScript, submitting the form displays that fragment as a page. Escape dynamic titles on the server as shown; no data is persisted.

HTMX is a small HTML extension that enables requests, events, and partial page updates through attributes. It works with server-rendered HTML instead of requiring a client-side application framework.

## Example

Use: Serve [hello.html](./hello.html) from an HTTP server and provide a `/hello` endpoint that returns the greeting fragment.

Learn more in the [HTMX documentation](https://htmx.org/docs/).

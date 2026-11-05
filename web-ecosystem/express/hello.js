const express = require("express");

const app = express();
app.get("/", (_request, response) => response.send("Hello, World!"));
app.listen(3000, () => console.log("http://localhost:3000"));

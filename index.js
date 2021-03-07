const path = require("path");
const express = require("express");
const data = require("./product.json");
const app = express();

app.get("/product", function (req, res) {
    res.status(200);
    // res.send(JSON.stringify(data));
    res.json(data);
});

app.listen(3030);
console.log("Running at 3030");
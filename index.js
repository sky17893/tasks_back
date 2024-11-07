const PORT = 8000;

const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.send("Hello World Tasks App Node Test Root");
});

app.use(require("./routers/getRouter"));

app.listen(PORT, () => console.log(`Server is running on port ${PORT}`));

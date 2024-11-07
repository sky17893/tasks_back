const router = require("express").Router();
const { getTasks } = require("../controller/getTaskCtrl");

router.get("/getTasks/:userId", getTasks);

module.exports = router;

const express = require("express");
const BloodBank = require("../models/BloodBank");

const router = express.Router();

// Get Blood Stock
router.get("/:location", async (req, res) => {
  try {
    const bloodBanks = await BloodBank.find({ location: req.params.location });
    res.json(bloodBanks);
  } catch (error) {
    res.status(500).json({ message: "Server Error" });
  }
});

module.exports = router;

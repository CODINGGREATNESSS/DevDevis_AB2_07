const express = require("express");
const SOSAlert = require("../models/SOSAlert");
const authMiddleware = require("../middleware/authMiddleware");

const router = express.Router();

// Create an SOS Alert
router.post("/sos", authMiddleware, async (req, res) => {
  const { location, emergencyType } = req.body;

  try {
    const alert = new SOSAlert({
      user: req.user.id,
      location,
      emergencyType,
    });

    await alert.save();
    res.status(201).json({ message: "SOS alert created", alert });
  } catch (error) {
    res.status(500).json({ message: "Server Error" });
  }
});

module.exports = router;

const express = require("express");
const router = express.Router();
const User = require("../models/User");
const authMiddleware = require("../middleware/authMiddleware");

// Get list of available donors
router.get("/available", authMiddleware, async (req, res) => {
  try {
    const donors = await User.find({ isAvailable: true, isDonor: true });
    res.json({ donors });
  } catch (error) {
    res.status(500).json({ message: "Server Error" });
  }
});

// Update donor availability
router.put("/availability", authMiddleware, async (req, res) => {
  try {
    const { isAvailable } = req.body;
    await User.findByIdAndUpdate(req.user.id, { isAvailable });
    res.json({ message: "Availability updated successfully" });
  } catch (error) {
    res.status(500).json({ message: "Server Error" });
  }
});

module.exports = router;

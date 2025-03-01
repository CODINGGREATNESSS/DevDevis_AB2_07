const express = require("express");
const router = express.Router();
const BloodRequest = require("../models/BloodRequest");
const authMiddleware = require("../middleware/authMiddleware");

router.post("/request", authMiddleware, async (req, res) => {
  try {
    const { bloodType, urgency, location } = req.body;
    const request = new BloodRequest({
      requester: req.user.id,
      bloodType,
      urgency,
      location,
    });
    await request.save();
    res.status(201).json({ message: "Blood request created", request });
  } catch (error) {
    res.status(500).json({ message: "Server Error" });
  }
});

module.exports = router;  // ✅ Ensure this line is present


// Match Blood Donor
router.get("/match/:id", authMiddleware, async (req, res) => {
  try {
    const request = await BloodRequest.findById(req.params.id);
    if (!request) return res.status(404).json({ message: "Request not found" });

    const donors = await User.find({ bloodType: request.bloodType, isAvailable: true, isDonor: true });

    if (donors.length === 0) {
      return res.status(404).json({ message: "No donors available" });
    }

    res.json({ donors });
  } catch (error) {
    res.status(500).json({ message: "Server Error" });
  }
});

module.exports = router;

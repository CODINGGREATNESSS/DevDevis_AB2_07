const mongoose = require("mongoose");

const SOSAlertSchema = new mongoose.Schema({
  user: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
  location: { type: String, required: true },
  emergencyType: { type: String, required: true },
  responders: [{ type: mongoose.Schema.Types.ObjectId, ref: "User" }], 
  status: { type: String, enum: ["Active", "Resolved"], default: "Active" },
  createdAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model("SOSAlert", SOSAlertSchema);

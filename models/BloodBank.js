const mongoose = require("mongoose");

const BloodBankSchema = new mongoose.Schema({
  hospitalName: { type: String, required: true },
  location: { type: String, required: true },
  bloodStock: {
    "A+": { type: Number, default: 0 },  // ✅ Wrapped in quotes
    "A-": { type: Number, default: 0 },
    "B+": { type: Number, default: 0 },
    "B-": { type: Number, default: 0 },
    "AB+": { type: Number, default: 0 },
    "AB-": { type: Number, default: 0 },
    "O+": { type: Number, default: 0 },
    "O-": { type: Number, default: 0 },
  },
});

module.exports = mongoose.model("BloodBank", BloodBankSchema);

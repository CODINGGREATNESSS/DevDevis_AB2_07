const mongoose = require("mongoose");

const UserSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  bloodType: { type: String, required: true },
  location: { type: String, required: true },
  phone: { type: String, required: true },
  isDonor: { type: Boolean, default: false },
  isAvailable: { type: Boolean, default: true }, // Active donor status
});

module.exports = mongoose.model("User", UserSchema);

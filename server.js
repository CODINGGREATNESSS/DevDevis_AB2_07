const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const dotenv = require("dotenv");

const authRoutes = require("./routes/authRoutes");
const requestRoutes = require("./routes/requestRoutes");
const donorRoutes = require("./routes/donorRoutes");  
const bloodBankRoutes = require("./routes/bloodBankRoutes");

dotenv.config();
const app = express();

app.use(express.json());
app.use(cors());

// ✅ Ensure imported routes are correct
app.use("/api/auth", authRoutes);
app.use("/api/requests", requestRoutes);
app.use("/api/donors", donorRoutes);
app.use("/api/bloodbanks", bloodBankRoutes);

// ✅ MongoDB Connection
mongoose
  .connect(process.env.MONGO_URI) // No need for extra options
  .then(() => console.log("MongoDB connected"))
  .catch((err) => console.error("MongoDB connection error:", err));

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

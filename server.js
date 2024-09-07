import express from "express";
import dotenv from "dotenv";
import bodyParser from "body-parser";
import cors from "cors"; // Pastikan menggunakan import
import userRoutes from "./routes/userRoutes.js";
import productRoutes from "./routes/productRoutes.js"; // Import product routes
import { Sequelize } from "sequelize";

// Memuat variabel lingkungan dari file .env
dotenv.config();

// Inisialisasi Express
const app = express();

// Menggunakan CORS middleware setelah inisialisasi app
app.use(cors());

// Inisialisasi Sequelize dengan variabel lingkungan dari .env
const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    dialect: "postgres",
    port: process.env.DB_PORT,
  }
);

// Menghubungkan ke database dan memeriksa koneksi
sequelize
  .authenticate()
  .then(() => {
    console.log("Database connected successfully.");
    return sequelize.sync({ force: true }); // Menyinkronkan model dengan database
  })
  .then(() => {
    console.log("Models synchronized with database.");
  })
  .catch((err) => {
    console.error("Unable to connect to the database:", err);
  });

// Menggunakan body parser untuk menangani request body dalam format JSON
app.use(bodyParser.json());

// Menggunakan routes
app.use("/api/users", userRoutes);
app.use("/api/products", productRoutes); // Tambahkan route untuk produk

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

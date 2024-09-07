import { Sequelize } from "sequelize";
import dotenv from "dotenv";

dotenv.config();

const sequelize = new Sequelize(
  process.env.DB_NAME, // Nama database
  process.env.DB_USER, // Pengguna
  process.env.DB_PASSWORD, // Kata sandi
  {
    host: process.env.DB_HOST, // Host database
    dialect: "postgres", // Dialek yang digunakan
    port: process.env.DB_PORT, // Port database
    logging: false, // Nonaktifkan logging query SQL
  }
);

export default sequelize;

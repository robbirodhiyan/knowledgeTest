import { DataTypes } from "sequelize";
import sequelize from "../config/database.js";

const User = sequelize.define(
  "User",
  {
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    gender: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    tableName: "users",
    timestamps: true, // Menggunakan createdAt dan updatedAt
    createdAt: "created_at", // Menyelaraskan dengan nama kolom di database
    updatedAt: "updated_at", // Menyediakan nama tabel eksplisit jika diperlukan
  }
);



export default User;

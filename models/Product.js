import { DataTypes } from "sequelize";
import sequelize from "../config/database.js";

const Product = sequelize.define(
    "Product", {
    name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  description: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  price: {
    type: DataTypes.DECIMAL,
    allowNull: false,
  },
  user_id: {
    type: DataTypes.INTEGER,
    references: {
      model: "Users",
      key: "id",
    },
  },
  },
  {
    tableName: "products",
    timestamps: true, // Menggunakan createdAt dan updatedAt
    createdAt: "created_at", // Menyelaraskan dengan nama kolom di database
    updatedAt: "updated_at", // Menyediakan nama tabel eksplisit jika diperlukan
  }
);

export default Product;

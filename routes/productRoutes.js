import express from "express";
import {
  createProduct,
  getAllProducts,
  updateProduct,
  deleteProduct,
} from "../controllers/productController.js";
import { authenticateToken } from "../middleware/auth.js"; // Import the middleware

const router = express.Router();

// Apply authenticateToken middleware to routes that need authentication
router.post("/products", authenticateToken, createProduct);
router.get("/products", authenticateToken, getAllProducts);
router.put("/products/:id", authenticateToken, updateProduct);
router.delete("/products/:id", authenticateToken, deleteProduct);

export default router;

import Product from "../models/Product.js";

// Create Product
export const createProduct = async (req, res) => {
  const { name, description, price } = req.body;
  try {
    const product = await Product.create({
      name,
      description,
      price,
      user_id: req.user.id, // user_id berasal dari JWT token
    });
    res.json({ message: "Product created successfully", product });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Get All Products
export const getAllProducts = async (req, res) => {
  try {
    const products = await Product.findAll({ where: { user_id: req.user.id } });
    res.json(products);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Update Product
export const updateProduct = async (req, res) => {
  const { name, description, price } = req.body;
  try {
    const product = await Product.findByPk(req.params.id);
    if (product && product.user_id === req.user.id) {
      product.name = name;
      product.description = description;
      product.price = price;
      await product.save();
      res.json({ message: "Product updated", product });
    } else {
      res.status(404).json({ message: "Product not found or unauthorized" });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Delete Product
export const deleteProduct = async (req, res) => {
  try {
    const product = await Product.findByPk(req.params.id);
    if (product && product.user_id === req.user.id) {
      await product.destroy();
      res.json({ message: "Product deleted" });
    } else {
      res.status(404).json({ message: "Product not found or unauthorized" });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

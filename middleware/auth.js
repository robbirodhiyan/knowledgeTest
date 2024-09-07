import dotenv from "dotenv";
import jwt from "jsonwebtoken";

dotenv.config();

// Middleware for JWT verification
export const authenticateToken = (req, res, next) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1]; // Extract the token from the Authorization header

  if (!token) {
    return res.status(401).json({ message: "No token provided" }); // Return 401 Unauthorized if no token is present
  }

  // Verify the token
  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) {
      return res.status(403).json({ message: "Invalid token" }); // Return 403 Forbidden if the token is invalid
    }

    req.user = user; // Attach the user object to the request
    next(); // Proceed to the next middleware or route handler
  });
};

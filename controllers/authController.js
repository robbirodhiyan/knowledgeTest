import dotenv from "dotenv";
import jwt from "jsonwebtoken";

dotenv.config();

// Generate JWT Token
const generateToken = (user) => {
  return jwt.sign(
    {
      id: user.id,
      email: user.email,
    },
    process.env.JWT_SECRET,
    { expiresIn: process.env.JWT_EXPIRES_IN } // Token expires in 1 day (1d)
  );
};

// Controller untuk login
exports.login = async (req, res) => {
  const { email, password } = req.body;

  // Cari user di database (gunakan ORM seperti Sequelize atau query langsung)
  const user = await User.findOne({ where: { email } });

  if (!user || !(await bcrypt.compare(password, user.password))) {
    return res.status(401).json({ message: "Email atau password salah" });
  }

  // Buat token JWT
  const token = generateToken(user);

  // Kirim token sebagai response
  res.json({
    message: "Login berhasil",
    token: token,
  });
};

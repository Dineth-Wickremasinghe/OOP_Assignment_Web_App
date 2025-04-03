package org.example.oop_assignment_web_app;
import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
    // Method to hash a password
    public static String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt(12)); // 12 is the work factor
    }

    // Method to verify a password
    public static boolean checkPassword(String password, String hashedPassword) {
        return BCrypt.checkpw(password, hashedPassword);
    }
}

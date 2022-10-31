package com.msys.shoppingcart.security;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

@Service
public class AESAlgorithm {
    private static final String ALGORITHM = "AES";
    private static final byte[] keyValue =new byte[] { 'T', 'h', 'e', 'B', 'e', 's', 't','S', 'e', 'c', 'r','e', 't', 'K', 'e', 'y' };
//            "1234567891234567".getBytes(StandardCharsets.UTF_8);

    public static Key generateKey() {
        return new SecretKeySpec(keyValue, ALGORITHM);
      //  return new SecretKeySpec(keyValue, ALGORITHM);
    }
    public static String encrypt(String valueToEncrypt, Key key) throws Exception {
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptValue = cipher.doFinal(valueToEncrypt.getBytes());
        byte[] encryptedByteValue = new Base64().encode(encryptValue);
        return new String(encryptedByteValue);
    }
    public static String decrypt(String encryptedValue, Key key) throws NoSuchPaddingException, NoSuchAlgorithmException,
            InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] decodedBytes = new Base64().decode(encryptedValue.getBytes());
        byte[] encryptValue = cipher.doFinal(decodedBytes);
        return new String(encryptValue);
    }

//    public static String encrypt(String valueToEncrypt, Key key)  {
//        Cipher cipher = null;
//        try {
//            cipher = Cipher.getInstance(ALGORITHM);
//        } catch (NoSuchAlgorithmException e) {
//            throw new RuntimeException(e);
//        } catch (NoSuchPaddingException e) {
//            throw new RuntimeException(e);
//        }
//        try {
//            cipher.init(Cipher.ENCRYPT_MODE, key);
//        } catch (InvalidKeyException e) {
//            throw new RuntimeException(e);
//        }
//        byte[] encryptValue = new byte[0];
//        try {
//            encryptValue = cipher.doFinal(valueToEncrypt.getBytes());
//        } catch (IllegalBlockSizeException e) {
//            throw new RuntimeException(e);
//        } catch (BadPaddingException e) {
//            throw new RuntimeException(e);
//        }
//        byte[] encryptedByteValue = new Base64().encode(encryptValue);
//        return new String(encryptedByteValue);
//    }


//    public static String decrypt(String encryptedValue, Key key) throws Exception {
//        Cipher cipher = Cipher.getInstance(ALGORITHM);
//        cipher.init(Cipher.DECRYPT_MODE, key);
//        byte[] decodedBytes = new Base64().decode(encryptedValue.getBytes());
//        byte[] encryptValue = cipher.doFinal(decodedBytes);
//        return new String(encryptValue);
//    }
}


//import org.apache.commons.codec.binary.Base64;
//import org.springframework.stereotype.Service;
//
//import javax.crypto.Cipher;
//import javax.crypto.spec.SecretKeySpec;
//import java.nio.charset.StandardCharsets;
//import java.security.Key;
//@Service
//public class AESAlgorithm {
//    private static final String ALGORITHM = "AES";
//    private static final byte[] keyValue = "1234567891234567".getBytes(StandardCharsets.UTF_8);
//
////    private static final String ALGORITHM = "AES";
////        private static final byte[] keyValue = "1234567891234567".getBytes(StandardCharsets.UTF_8);
//
//        public static Key generateKey() {
//            Key key = new SecretKeySpec(keyValue, ALGORITHM);
//            return key;
//        }
//
//        public static String encrypt(String valueToEncrypt, Key key) throws Exception {
//            Cipher cipher = Cipher.getInstance(ALGORITHM);
//            cipher.init(Cipher.ENCRYPT_MODE, key);
//            byte[] encryptValue = cipher.doFinal(valueToEncrypt.getBytes());
//            String encryptedByteValue = String.valueOf(new Base64().encode(encryptValue));
//            return new String(encryptedByteValue);
//        }
//
//        public static String decrypt(String encryptedValue, Key key) throws Exception {
//            Cipher cipher = Cipher.getInstance(ALGORITHM);
//            cipher.init(Cipher.DECRYPT_MODE, key);
////            byte[] decodedBytes = new Base64().decode(encryptedValue.getBytes());
////            byte[] encryptValue = cipher.doFinal(decodedBytes);
//
//            byte[] base64decodedTokenArr = Base64.decodeBase64(encryptedValue.getBytes());
//            byte[] encryptValue = cipher.doFinal(base64decodedTokenArr);
//
//          //  byte[] decryptedPassword = cipher.doFinal(decodeStr.getBytes());
//
//            return new String(encryptValue);
//        }
//    }


//package com.msys.security;
//
//import org.springframework.stereotype.Service;
//
//@Service
//public class PasswordSecurity {
//    public static final String value = "SECURE";
//    public static final int secretKey = 128;
//
//
//   public static  String encrypt = getEncryptedValue(value);
//
//    public static String getEncryptedValue(String value) {
//        String encrypt = "";
//        for (int i = 0; i < value.length(); i++) {
//            char character = value.charAt(i);
//            character += secretKey;
//            encrypt = encrypt + character;
//
//        }
//        return encrypt;
//    }
//}
//
//
////    private static final String ALGORITHM = "AES";
////    private static final byte[] keyValue = "1234567891234567".getBytes(StandardCharsets.UTF_8);
//



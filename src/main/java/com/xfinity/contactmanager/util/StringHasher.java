package com.xfinity.contactmanager.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.nio.charset.StandardCharsets;
import java.math.BigInteger;

public class StringHasher {

    private static String hash_algorithm = "SHA-256";

    public static String getHash_algorithm() {
        return hash_algorithm;
    }

    public static void setHash_algorithm(String hash_algorithm) {
        StringHasher.hash_algorithm = hash_algorithm;
    }

    public static String hashStringSHA256(String input) {
        try {
            // Get an instance of the SHA-256 message digest algorithm
            MessageDigest digest = MessageDigest.getInstance(hash_algorithm);

            // Convert the input string to bytes using UTF-8 charset
            byte[] hashBytes = digest.digest(input.getBytes(StandardCharsets.UTF_8));

            // Convert the byte array to a hexadecimal string
            // BigInteger can simplify this conversion, but padding might be needed
            BigInteger no = new BigInteger(1, hashBytes);

            // Convert message digest into hex value
            String hashString = no.toString(16);

            // Pad with leading zeros to ensure the full 64-character length (for SHA-256)
            while (hashString.length() < 64) {
                hashString = "0" + hashString;
            }

            return hashString;

        } catch (NoSuchAlgorithmException e) {
            // Handle the exception if the algorithm is not available
            e.printStackTrace();
            return null;
        }
    }

}
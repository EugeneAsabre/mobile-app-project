import 'dart:convert';

class CustomEncryption {
  // Substitution map (for demonstration purposes)
  static final Map<int, int> _substitutionMap = {
    65: 88, 66: 89, 67: 90, // A -> X, B -> Y, C -> Z
    97: 120, 98: 121, 99: 122, // a -> x, b -> y, c -> z
    // Add more mappings as needed
  };

  // Reverse substitution map
  static final Map<int, int> _reverseSubstitutionMap = {
    88: 65, 89: 66, 90: 67, // X -> A, Y -> B, Z -> C
    120: 97, 121: 98, 122: 99, // x -> a, y -> b, z -> c
    // Add more mappings as needed
  };

  // Shift value (for demonstration purposes)
  static const int _shiftValue = 5;

  // Encrypt function
  static String encrypt(String plainText) {
    final bytes = utf8.encode(plainText);
    final encryptedBytes = bytes.map((byte) {
      // Apply substitution
      final substitutedByte = _substitutionMap[byte] ?? byte;
      // Apply shift
      return substitutedByte + _shiftValue;
    }).toList();
    return base64Encode(encryptedBytes);
  }

  // Decrypt function
  static String decrypt(String encryptedText) {
    final encryptedBytes = base64Decode(encryptedText);
    final decryptedBytes = encryptedBytes.map((byte) {
      // Reverse shift
      final shiftedByte = byte - _shiftValue;
      // Reverse substitution
      return _reverseSubstitutionMap[shiftedByte] ?? shiftedByte;
    }).toList();
    return utf8.decode(decryptedBytes);
  }
}

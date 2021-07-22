import 'dart:convert';

import 'package:encrypt/encrypt.dart';
class AESHelper {

  String key = 'aesEncryptionKey';
  String iv = 'aesEncryptionIV!';

   Encrypted encrypt(String plainText){
    final key1 = Key.fromUtf8(key);
    final iv1 = IV.fromUtf8(iv);
    final encrypter = Encrypter(AES(key1));
    print('Dart Output…!!!');
    print('IV: ' + iv1.bytes.toString());
    print('Key: ' + key1.bytes.toString());
    final encrypted = encrypter.encrypt(plainText, iv: iv1);
    print('Encrypted: '+ encrypted.bytes.toString());
    print('Base64: '+encrypted.base64);
    return encrypted;

  }

  String decrypt(Encrypted encrypted){
    final key1 = Key.fromUtf8(key);
    final iv1 = IV.fromUtf8(iv);
    final encrypter = Encrypter(AES(key1));
    final decrypted = encrypter.decrypt(encrypted, iv: iv1);
    print('Decrypted: '+ decrypted);
    return decrypted;
  }

  static void Testing() {
    final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
    final key = Key.fromUtf8('bXVzdGJlMTZieXRlc2tleQ==');

    final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    // if you need to use the ttl feature, you'll need to use APIs in the algorithm itself
    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);

    final encrypted = encrypter.encrypt(plainText);
    final decrypted = encrypter.decrypt(encrypted);

    print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
    print(encrypted.base64); // random cipher text
    print(fernet.extractTimestamp(encrypted.bytes)); // u


    final encrypterd = new Encrypter(new AES(key, mode: AESMode.cbc,padding: 'PKCS7'));
    print('plainText: '+plainText);
    final encryptedText = encrypter.encrypt(plainText);
    print('encryptedText :'+encryptedText.base64);
  }

}
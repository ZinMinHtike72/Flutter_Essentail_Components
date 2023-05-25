import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:path_provider/path_provider.dart';
// import 'p';

class EncryptServices {
  Future<Encrypted?> encryptAes({File? file}) async {
    if (file != null) {
      final key = Key.fromLength(32);
      final iv = IV.fromLength(16);
      final encrypter = Encrypter(AES(key));
      final changeData = await file.readAsBytes();
      final encrypted = encrypter.encryptBytes(changeData, iv: iv);
      return encrypted;
    } else {
      return null;
    }

    // Write the encrypted data back to the file
    // file.writeAsBytesSync(encrypted.bytes);
  }

  void decrypt({required Encrypted encryptData}) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = await File("assets/name.jpg").create();
    final key = Key.fromLength(32);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final changeData = encrypter.decryptBytes(encryptData, iv: iv);
    final File newFile = await file.writeAsBytes(changeData);
  }
}

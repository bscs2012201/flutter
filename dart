import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String plainText = 'a'; // Text to encrypt

  // Static key pair (Replace with your own key pair)
  final publicKey = 'MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAhqaWcT5dbaHrMqgN3W4YNaDIcGie2JGUa7MJ8iT5FEGsDX9neRPVntgMkoDpnIgh3a7UQCO8syym1a7QIoKmMfwuopf1Fstmj+SSy9XnFPybYdv1FGlHAaefb46Do0HGSk+Az6NsuWR8iqbRV+WdSjQ6cwfoaJLn/uf2it0bTkFe17n7WIkXWQn6eSWxdI3hcrXCEfp1kh6j7wPC86z7LbFU3H7cS1Aw6YQwXQ3NgHccwbMRxWTk4897MewSXKGmcjLXq6oR784LoUqHl02BJAyHl+6GpGdQD3AcRh79LCHlAsv3XVOXS96BgUdnwf1/N4/LZBig19Cu4uEOea8rVmWeES1Wi0fOVcZs1CqijO17Q6Mai+HIIZzd+Eb2CuIeJVUMEBgRxX2+UluhM7AdXKspP15hIoXZeHCojvMOWWPg7aQ+iuMPOVDH3AngnQNemMeRRiX28tz7Dv5WornzIYtdcDg+MQhalJXrF9HDWGniusP2Cj+LTM3km7qnMlJFNazJTyC9xB3zxv/XtloBLQuLYT54BCK4N6N9FyYQXdG3QZCaHUkDviFmT99B6aL2ZShuvdQVGU+uIsAfcNwul+x00tkOoIhpqKoPycZuHqoAYYGHFwNRvtcP7MKYyge17ZBtrSSGg4xxXDArUZ1Fuuk8m76RqMbgIjjqakCI3lsCAwEAAQ==';
  final privateKey = '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';

  @override
  Widget build(BuildContext context) {
    final encryptedText = encrypt(plainText);
    final decryptedText = decrypt(encryptedText);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Encryption and Decryption'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Plain Text: $plainText',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Encrypted Text: $encryptedText',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Decrypted Text: $decryptedText',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String encrypt(String text) {
    final encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privateKey));
    final encrypted = encrypter.encrypt(text);
    return encrypted.base64;
  }

  String decrypt(String encryptedText) {
    final encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privateKey));
    final encrypted = Encrypted.fromBase64(encryptedText);
    final decrypted = encrypter.decrypt(encrypted);
    return decrypted;
  }
}

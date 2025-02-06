import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'encryption.dart';
import 'key_storage.dart';

class DecryptPage extends StatefulWidget {
  const DecryptPage({super.key});

  @override
  State<DecryptPage> createState() => _DecryptPageState();
}

class _DecryptPageState extends State<DecryptPage> {
  final TextEditingController decryptedMessageController =
      TextEditingController();
  final TextEditingController keyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // called the decryptionKey from the key_storage.dart to be used here
  String key = DecryptionKeyStorage.decryptionKey;

  @override
  void dispose() {
    // dispose controllers to avoid memory leakage
    decryptedMessageController.dispose();
    keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Form(
        // Used form to be able to use validation
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Message to be decrypted',
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: TextFormField(
              controller: decryptedMessageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Encryption Message',
                labelStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: keyController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Decryption Key',
                labelStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the decryption key';
                }
                //Making sure the value is equal to that of the one in encrypt_page.dart
                if (value != key) {
                  return 'The decryption key is incorrect';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 80.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  ClipboardData? clipboardData =
                      await Clipboard.getData('text/plain');
                  String clipboardText = clipboardData?.text ?? '';
                  // This is checking if the encrypted message you want to decrypt is the same as the one copied or generated
                  // from the encrypt page
                  if (decryptedMessageController.text != clipboardText) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Sorry Wrong message'),
                          actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Decrypted Message'),
                          content: Text(
                            CustomEncryption.decrypt(
                                decryptedMessageController.text),
                          ),
                          actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text('Decrypt'),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

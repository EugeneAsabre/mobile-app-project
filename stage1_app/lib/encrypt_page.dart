import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './encryption.dart';
import 'key_storage.dart';

class EncryptPage extends StatefulWidget {
  const EncryptPage({super.key});

  @override
  State<EncryptPage> createState() => _EncryptPageState();
}

class _EncryptPageState extends State<EncryptPage> {
  final TextEditingController messageController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//dispose the controllers to avoid any memory leak
  @override
  void dispose() {
    messageController.dispose();
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
        // Put the whole body in a form so i can do some validation
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Type message to be encrypted here',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Message',
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
                validator: (decryptValue) {
                  if (decryptValue == null || decryptValue.isEmpty) {
                    return 'Please enter a decryption key';
                  }
                  return null;
                  // Making sure user inputs a key
                },
              ),
            ),
            SizedBox(height: 80.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Encrypted Message'),
                          content: Text(
                            CustomEncryption.encrypt(messageController.text),
                          ), //show the encrypted message in an alert Dialog
                          actions: [
                            TextButton(
                              // Making user able to copy the encrypted message to the clipboard
                              child: Text('Copy'),
                              onPressed: () {
                                DecryptionKeyStorage.decryptionKey =
                                    keyController.text;
                                Clipboard.setData(ClipboardData(
                                    text: CustomEncryption.encrypt(
                                        messageController.text)));
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
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
                    child: Text('Encrypt'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

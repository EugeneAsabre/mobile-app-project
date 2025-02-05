import 'package:flutter/material.dart';

class EncryptPage extends StatefulWidget {
  const EncryptPage({super.key});

  @override
  State<EncryptPage> createState() => _EncryptPageState();
}

TextEditingController messageController = TextEditingController();
TextEditingController keyController = TextEditingController();

class _EncryptPageState extends State<EncryptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Type message to be encrypted here',
          style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
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
          ),
        ),
        SizedBox(height: 80.0),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            //will remove snackbar and use alert to display actual
            //encryted message.
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Encryption started'),
                ),
              );
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
      ]),
    );
  }
}

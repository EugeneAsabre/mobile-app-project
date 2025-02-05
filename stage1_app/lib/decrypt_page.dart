import 'package:flutter/material.dart';

class DecryptPage extends StatefulWidget {
  const DecryptPage({super.key});

  @override
  State<DecryptPage> createState() => _DecryptPageState();
}

class _DecryptPageState extends State<DecryptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Message to be decrypted',
          style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: TextFormField(
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
            //decrypted message.
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Decryption started'),
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
                child: Text('Decrypt'),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

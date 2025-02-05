import 'package:flutter/material.dart';
import 'package:stage1_app/decrypt_page.dart';
import 'package:stage1_app/encrypt_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stage1_app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'stage1_app',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        titleSpacing: .7,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _button(context, 'Encrypt Data', () => _encryptPage(context)),
          SizedBox(height: 20.0),
          _button(context, 'Decrypt Data', () => _decryptPage(context)),
        ],
      ),
    );
  }

  void _encryptPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EncryptPage()),
    );
  }

  void _decryptPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DecryptPage(),
      ),
    );
  }

  Widget _button(
      BuildContext context, String buttonText, VoidCallback pageRoute) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GestureDetector(
          onTap: pageRoute,
          child: Container(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .6,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            )),
          ),
        ),
      ),
    );
  }
}

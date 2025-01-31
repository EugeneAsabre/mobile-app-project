import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stage0_app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stage0_app',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        titleSpacing: .7,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Below is a link leading to the github repository of this very application. Do enjoy your findings',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: _githubUrl,
              child: Container(
                height: 40.0,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text("Github Repository"),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text('Below you will find other links to HNG Hire pages',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: GestureDetector(
                onTap: _flutterHireUrl,
                child: Container(
                  height: 40.0,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text("Flutter hire"),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: _reactHireUrl,
              child: Container(
                height: 40.0,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text("React hire"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _githubUrl() async {
    final Uri url =
        Uri.parse('https://github.com/EugeneAsabre/mobile-app-project');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  _flutterHireUrl() async {
    final Uri url = Uri.parse('https://hng.tech/hire/flutter-developers');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  _reactHireUrl() async {
    final Uri url = Uri.parse('https://hng.tech/hire/react-native-developers');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}

import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {

  const WebViewPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebViewState();
  }
}

class WebViewState extends State<WebViewPage> {
  String? name;

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments;

    if (args is Map) {
      name = args["name"];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? "", style: TextStyle(fontSize: 16),),
      ),
      body: SafeArea(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(""),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carte du Monde'),
      ),
      body: WebView(
        initialUrl: 'https://oswald-faust.github.io/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

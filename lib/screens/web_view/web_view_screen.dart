import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewScreen extends StatelessWidget {
  final String url;
  WebViewScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Image.asset('assets/images/newshub.png',height: 26,),
        ),
      ),
      body: WebView(
        initialUrl:url,
      ),
    );
  }
}



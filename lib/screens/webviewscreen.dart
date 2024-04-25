import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final link;
  const WebViewScreen({super.key,required this.link});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  late InAppWebViewController webView;


   double _progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: InAppWebView(initialUrlRequest: URLRequest(url:
     Uri.parse(widget.link)),
     onWebViewCreated: (InAppWebViewController controller) =>webView=controller ,
     onProgressChanged: ( InAppWebViewController controller, progress){
      setState(() {
        _progress=progress/100;
      });
     } ,
     ),
    );
  }
}
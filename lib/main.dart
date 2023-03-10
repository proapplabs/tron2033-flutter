import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}
class _WebViewExampleState extends State<WebViewExample> {
  final _key = UniqueKey();
  final String _url = 'trxoreo.com';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: SafeArea(
        child: WebView(
          key: _key,
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://'+_url+'/?mobile=true',
          navigationDelegate: (NavigationRequest request) {
            // WebView içindeki linkleri açmak için kontrol ediyoruz.
            debugPrint(request.url);
            // request.url.startsWith('https://'+_url+'/?mobile=true#')
            if (request.url.startsWith('https://t.me')) {
              launch(request.url);
             return NavigationDecision.prevent;
            }
            if (request.url.startsWith(request.url+'/googleplay/')) {
              launch(request.url);
             return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }
}

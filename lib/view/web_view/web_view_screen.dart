import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String initialUrl;
  final String titlePage;

  const WebViewScreen(
      {super.key, required this.initialUrl, required this.titlePage});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(widget.titlePage),
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: widget.initialUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {},
              onPageStarted: (String url) {},
              onPageFinished: (url) {
                setState(() {
                  _isLoading = false;
                });
              },
              gestureNavigationEnabled: true,
            ),
            if (_isLoading)
              Center(
                child: SpinKitCircle(color: Colors.blue[900], size: 32),
              ),
          ],
        ));
  }
}

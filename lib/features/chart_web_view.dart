import 'package:flutter/material.dart';
import 'package:trading_app/core/hex_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChartWebView extends StatefulWidget {
  const ChartWebView({super.key});

  @override
  State<ChartWebView> createState() => _ChartWebViewState();
}

class _ChartWebViewState extends State<ChartWebView> {
  late WebViewController controller;

  @override
  void initState() {
    _initController();
    super.initState();
  }

  String embeddedCode = ''' 
 <!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div id="tradingview_4e221" style="width": 100%;"></div>
  
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
  new TradingView.widget(
  {
  "autosize": true,
  "symbol": "BITSTAMP:BTCUSD",
  "interval": "D",
  "timezone": "Etc/UTC",
  "theme": "dark",
  "style": "1",
  "width": "100%",
  "height": "100%",
  "locale": "en",
  "toolbar_bg": "#f1f3f6",
  "enable_publishing": false,
  "backgroundColor": "rgba(18,21,54,255)",
  "hide_top_toolbar": true,
  "hide_legend": true,
  "save_image": false,
  "container_id": "tradingview_4e221"
}
  );
  </script>
</div>
<!-- TradingView Widget END -->
  ''';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#121536"),
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }

  void _initController() {
    controller = WebViewController()
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {
              setState(() {});
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print(request.url);
            if (request.url.startsWith('https://www.tradingview.com/chart')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadHtmlString(embeddedCode);
  }
}

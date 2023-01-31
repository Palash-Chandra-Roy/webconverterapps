import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  var initialUrl = "https://techdsf.com/";
  var loading = true.obs;
  var url;
  late final WebViewController controller;

  @override
  void onInit() {
      
    // TODO: implement onInit
    super.onInit();

    // #docregion platform_features
    const PlatformWebViewControllerCreationParams params =
        PlatformWebViewControllerCreationParams();
 

    final WebViewController ctr =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features
    
    ctr
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress > 99) {
              loading.value = false;
            }
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            loading.value = true;
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            loading.value = false;
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {},
      )
      ..loadRequest(Uri.parse('https://techdsf.com/'));

    // #enddocregion platform_features

    controller = ctr;
  }

  TextEditingController urlController = TextEditingController();
}

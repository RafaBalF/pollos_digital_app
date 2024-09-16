// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:pollos_digital/app/shared/colors.dart';
// import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:url_launcher/url_launcher.dart';

// class WebviewWidget extends StatefulWidget {
//   final String url;
//   final String title;
//   const WebviewWidget({super.key, required this.url, required this.title});
//   @override
//   WebviewWidgetState createState() => WebviewWidgetState();
// }

// class WebviewWidgetState extends State<WebviewWidget> {
//   final GlobalKey webViewKey = GlobalKey();

//   InAppWebViewController? webViewController;
//   InAppWebViewSettings settings = InAppWebViewSettings(
//     isInspectable: kDebugMode,
//     mediaPlaybackRequiresUserGesture: false,
//     allowsInlineMediaPlayback: true,
//     iframeAllowFullscreen: true,
//     userAgent: "app-webview",
//     upgradeKnownHostsToHTTPS: true,
//   );

//   PullToRefreshController? pullToRefreshController;
//   double progress = 0;
//   final urlController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     pullToRefreshController = kIsWeb
//         ? null
//         : PullToRefreshController(
//             settings: PullToRefreshSettings(
//               color: primary,
//             ),
//             onRefresh: () async {
//               if (defaultTargetPlatform == TargetPlatform.android) {
//                 webViewController?.reload();
//               } else if (defaultTargetPlatform == TargetPlatform.iOS) {
//                 webViewController?.loadUrl(
//                     urlRequest:
//                         URLRequest(url: await webViewController?.getUrl()));
//               }
//             },
//           );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       onPopInvoked: (didPop) async {
//         if (webViewController == null) return;

//         if (await webViewController!.canGoBack()) webViewController?.goBack();
//       },
//       child: SimpleScaffoldWidget(
//           title: widget.title,
//           body: SizedBox(
//             height: 100.h,
//             width: 100.w,
//             child: InAppWebView(
//               key: webViewKey,
//               initialUrlRequest: URLRequest(url: WebUri(widget.url)),
//               initialSettings: settings,
//               pullToRefreshController: pullToRefreshController,
//               onWebViewCreated: (controller) {
//                 webViewController = controller;
//               },
//               onLoadStart: (controller, url) {
//                 setState(() {
//                   urlController.text = widget.url.toString();
//                 });
//               },
//               onPermissionRequest: (controller, request) async {
//                 return PermissionResponse(
//                     resources: request.resources,
//                     action: PermissionResponseAction.GRANT);
//               },
//               shouldOverrideUrlLoading: (controller, navigationAction) async {
//                 var uri = navigationAction.request.url!;

//                 if (![
//                   "http",
//                   "https",
//                   "file",
//                   "chrome",
//                   "data",
//                   "javascript",
//                   "about"
//                 ].contains(uri.scheme)) {
//                   var isWhatsappUrl = uri.toString().contains("whatsapp://");
//                   if (isWhatsappUrl) {
//                     var whatsappUrlFormated = uri
//                         .toString()
//                         .replaceAll('whatsapp://send/?phone=', 'https://wa.me/')
//                         .replaceAll('&', '?')
//                         .replaceAll('?type=phone_number?app_absent=0', '');
//                     await launchUrl(Uri.parse(whatsappUrlFormated),
//                         mode: LaunchMode.externalApplication);
//                     webViewController?.goBack();
//                   } else {
//                     if (await canLaunchUrl(uri)) {
//                       // Launch the App
//                       await launchUrl(
//                         uri,
//                       );
//                       // and cancel the request
//                       return NavigationActionPolicy.CANCEL;
//                     }
//                   }
//                 }

//                 return NavigationActionPolicy.ALLOW;
//               },
//               onLoadStop: (controller, url) async {
//                 pullToRefreshController?.endRefreshing();
//                 setState(() {
//                   urlController.text = widget.url.toString();
//                 });
//               },
//               onReceivedError: (controller, request, error) {
//                 pullToRefreshController?.endRefreshing();
//               },
//               onProgressChanged: (controller, progress) {
//                 if (progress == 100) {
//                   pullToRefreshController?.endRefreshing();
//                 }
//                 setState(() {
//                   this.progress = progress / 100;
//                   urlController.text = widget.url;
//                 });
//               },
//               onUpdateVisitedHistory: (controller, url, androidIsReload) {
//                 setState(() {
//                   urlController.text = widget.url.toString();
//                 });
//               },
//               onConsoleMessage: (controller, consoleMessage) {
//                 if (kDebugMode) {
//                   print(consoleMessage);
//                 }
//               },
//             ),
//           )),
//     );
//   }

//   @override
//   void dispose() {
//     webViewController?.dispose();
//     super.dispose();
//   }
// }

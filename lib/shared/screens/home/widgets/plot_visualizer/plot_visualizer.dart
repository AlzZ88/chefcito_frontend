import 'package:flutter/material.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class PlotVisualizer extends StatefulWidget {
  const PlotVisualizer({super.key});

  @override
  State<PlotVisualizer> createState() => _PlotVisualizerState();
}

class _PlotVisualizerState extends State<PlotVisualizer> {
  late PlatformWebViewController _controller;
  late Future<void> _loadWebViewFuture;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
    _loadWebViewFuture = _loadWebView();
  }

  void _initializeWebView() {
    _controller = PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    );
  }

  Future<void> _loadWebView() async {
    await _controller.loadRequest(
      LoadRequestParams(
        uri: Uri.parse(''),
      ),
    );
  }

  void _updateWebView() {
    setState(() {
      _loadWebViewFuture = _loadWebView();
    });
  }

  @override
  void didUpdateWidget(covariant PlotVisualizer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      _updateWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _loadWebViewFuture,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading Dashboard'),
          );
        } else {
          return SizedBox(
            height: 250,
            width: 250,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: PlatformWebViewWidget(
                PlatformWebViewWidgetCreationParams(controller: _controller),
              ).build(context),
            ),
          );
        }
      },
    );
  }
}

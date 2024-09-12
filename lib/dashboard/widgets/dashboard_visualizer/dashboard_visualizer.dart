import 'package:flutter/material.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class DashboardVisualizer extends StatefulWidget {
  const DashboardVisualizer({super.key, required this.url});
  final String url;
  @override
  State<DashboardVisualizer> createState() => _DashboardVisualizerState();
}

class _DashboardVisualizerState extends State<DashboardVisualizer> {
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
    //print('$VISUALIZATION_HOST/plots/orbits/last-orbit/${widget.equipment}/${widget.orbit}/${widget.axis}/no_zoom_xy');

    await _controller.loadRequest(
      LoadRequestParams(
        uri: Uri.parse(widget.url),
      ),
    );
  }

  void _updateWebView() {
    setState(() {
      _loadWebViewFuture = _loadWebView();
    });
  }

  @override
  void didUpdateWidget(covariant DashboardVisualizer oldWidget) {
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
            height: MediaQuery.sizeOf(context).height - 260,
            width: MediaQuery.sizeOf(context).width,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.blue, width: 1),
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Webview extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  const Webview(
      {Key key,
      this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
      this.backForbid})
      : super(key: key);

  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backBtnColor =
        statusBarColorStr == 'ffffff' ? Colors.black : Colors.white;

    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(Color(int.parse('0xff' + statusBarColorStr)), backBtnColor),
          Expanded(
              child: WebviewScaffold(
            url: widget.url, // http协议的页面无法打开
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            initialChild: Container(
//              height: MediaQuery.of(context).size.height, // 设置webview高度
//              width: MediaQuery.of(context).size.width + 1, // 设置webview宽度
              color: Colors.white,
              child: Center( // Center也可以撑满
                child: Text('Loading...'),
              ),
            ),
          ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {});
    _onStateChanged =
        flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.startLoad:
          break;
        case WebViewState.finishLoad:
          // 全屏
          // https://github.com/fluttercommunity/flutter_webview_plugin/issues/356
//          flutterWebviewPlugin.resize(Rect.fromLTRB(
//            MediaQuery.of(context).padding.left,
//
//            /// for safe area
//            MediaQuery.of(context).padding.top,
//
//            /// for safe area
//            MediaQuery.of(context).size.width + 1,
//
//            /// add one to make it fullscreen
//            MediaQuery.of(context).size.height,
//          ));
          break;
        default:
          break;
      }
    });

    _onHttpError =
        flutterWebviewPlugin.onHttpError.listen((WebViewHttpError error) {
      print(error);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    flutterWebviewPlugin.dispose();
  }

  _appBar(Color bgColor, Color backBtnColor) {
    if (widget.hideAppBar ?? false) {
      return Container(
        color: bgColor,
        height: 30,
      );
    }

    return Container(
      padding: EdgeInsets.fromLTRB(0, 40, 10, 10),
      color: bgColor,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  color: backBtnColor,
                  size: 26,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.title ?? '',
                  style: TextStyle(color: backBtnColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

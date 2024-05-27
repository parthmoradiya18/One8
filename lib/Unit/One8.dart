

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class One8 extends StatefulWidget {
  const One8({Key? key}) : super(key: key);

  @override
  State<One8> createState() => _One8State();
}

class _One8State extends State<One8> {

  InAppWebViewController? w_v_c;

  bool F = false;
  bool B = false;

  double Progress = 0;
  PullToRefreshController? Refresh;
  String? w_c;
  String? w_l;
  @override
  void initState() {
    super.initState();

    Refresh = PullToRefreshController(
      onRefresh: () {
        w_v_c!.reload();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    w_l = ModalRoute.of(context)!.settings.arguments as String?;
    return WillPopScope(
      onWillPop: () async {
        await w_v_c!.goBack();
        return (w_c == w_l) ? true : false;
      },
      child: Scaffold(
        appBar:
        PreferredSize(child:
        AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "One8",
            style: TextStyle(fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),

          actions: [
            (B)
                ? IconButton(
              onPressed: () async {
                if (w_v_c != null) {
                  await w_v_c!.goBack();
                }
                setState(() {});
              },
              icon: const Icon(size: 20,
                Icons.arrow_back,
                color: Colors.white,
              ),
            )
                : Container(),
            IconButton(
              onPressed: () async {
                if (w_v_c != null) {
                  await w_v_c!.reload();
                }
                setState(() {});
              },
              icon: const Icon(size: 20,
                CupertinoIcons.refresh,
              ),
            ),
            (F)
                ? IconButton(
              onPressed: () async {
                if (w_v_c != null) {
                  await w_v_c!.goForward();
                }
              },
              icon: const Icon(size: 20,
                CupertinoIcons.arrow_right,
                color: Colors.white,
              ),
            )
                : Container(),
          ],
        ),preferredSize: Size(0, 45)),

        body: Column(
          children: [
            LinearProgressIndicator(
              value: Progress,
              backgroundColor: Colors.indigo.shade300,
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(w_l!),
                ),

                onLoadStop: (controller, url) async {
                  setState(() {
                    w_c = url.toString();
                  });
                  F = await w_v_c!.canGoForward();
                  B = await w_v_c!.canGoBack();
                  setState(() {});
                },
                pullToRefreshController: Refresh,
                onWebViewCreated: (controller) {
                  setState(() {
                    w_v_c = controller;
                  });
                },
                onLoadStart: (controller, url) async {
                  setState(() {
                    w_c = url.toString();
                  });
                  F = await w_v_c!.canGoForward();
                  B = await w_v_c!.canGoBack();
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

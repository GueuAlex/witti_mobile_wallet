import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:witti/widgets/go_back.dart';

class QrcodeScreen extends StatefulWidget {
  static const routeName = '/qrcodescreen';
  const QrcodeScreen({super.key});

  @override
  State<QrcodeScreen> createState() => _QrcodeScreenState();
}

class _QrcodeScreenState extends State<QrcodeScreen> {
  final RefreshController _controller =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const GoBack(
              text: 'Scanner',
            ),
            Expanded(
              child: SmartRefresher(
                //onLoading: () => ,
                onRefresh: _onRefresh,
                enablePullDown: true,
                enablePullUp: false,
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                header: const ClassicHeader(
                  completeText: "",
                  idleText: "",
                  refreshingText: "",
                  releaseText: "",
                ),
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(seconds: 5));
    _controller.refreshCompleted();
  }
}

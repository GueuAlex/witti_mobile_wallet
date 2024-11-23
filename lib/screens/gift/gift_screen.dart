import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:witti/widgets/go_back.dart';

class GiftScreen extends StatefulWidget {
  static const routeName = '/giftscreen';
  const GiftScreen({super.key});

  @override
  State<GiftScreen> createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  final RefreshController _controller =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const GoBack(
              text: 'vos bons cabeaux',
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
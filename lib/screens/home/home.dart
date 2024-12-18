import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../widgets/app_header.dart';
import 'widgets/build_icons.dart';
import 'widgets/credit_cards.dart';
import 'widgets/last_transactions.dart';
import 'widgets/row_actions_button.dart';
import 'widgets/total_balance.dart';

class WittiHome extends StatefulWidget {
  static const routeName = '/';
  const WittiHome({super.key});

  @override
  State<WittiHome> createState() => _WittiHomeState();
}

class _WittiHomeState extends State<WittiHome> {
  final RefreshController _controller =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const AppHeader(),
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
                      children: [
                        TotalBalance(),
                        Gap(8.0),
                        CreditCards(),
                        BuildIcons(),
                        Gap(16.0),
                        RowActionsButtons(),
                        Gap(20.0),
                        LastTransactions()
                      ],
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

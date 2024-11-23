import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:witti/screens/home/widgets/total_balance.dart';

import '../../config/constantes.dart';
import '../../widgets/go_back.dart';
import '../home/widgets/transaction_container.dart';
import 'widgets/custom_toggle.dart';
import 'widgets/linear_chart2.dart';

class AllTransaction extends StatefulWidget {
  static const routeName = '/all-transaction';
  const AllTransaction({super.key});

  @override
  State<AllTransaction> createState() => _AllTransactionState();
}

class _AllTransactionState extends State<AllTransaction> {
  //
  final RefreshController _controller =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(18, 158, 158, 158),
            child: const GoBack(text: 'Transactions'),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      color: const Color.fromARGB(18, 158, 158, 158),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomToggle(),
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 5),
                            child: TotalBalance(withLabel: false),
                          ),
                          BarChartSample2(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: Constantes.transactions
                            .map(
                              (tr) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: TransactionContainer(
                                  transaction: tr,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(seconds: 5));
    _controller.refreshCompleted();
  }
}

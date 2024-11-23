import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:witti/config/constantes.dart';

import '../../widgets/go_back.dart';
import 'widgets/t_details.dart';
import 'widgets/t_header.dart';

class TransactionDetails extends StatefulWidget {
  static const routeName = '/transaction-details';
  const TransactionDetails({super.key});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  //
  final RefreshController _controller =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 248, 250),
      body: Column(
        children: [
          const GoBack(),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TransHeader(
                        transaction: args,
                      ),
                      const Gap(15),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Tdetails(
                          transaction: args,
                        ),
                      ),
                      const Gap(12.0),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: _transRef(),
                      ),
                      const Gap(12.0),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: _downloadWidget(),
                      )
                    ],
                  ),
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

  Widget _transRef() {
    return Row(children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Référence',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 14.5,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 127, 127, 127),
              ),
            ),
            Text(
              'HQBSQXBR5XG616SEOZ',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 15.5,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 28, 28, 28),
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: const Icon(
          Icons.copy,
          color: Constantes.primaryColor,
          size: 18,
        ),
      ),
    ]);
  }

  Widget _downloadWidget() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icon/fichier-pdf.svg',
                width: 30,
              ),
              const Gap(8.0),
              const Text('Reçu.pdf')
            ],
          ),
        ),
        GestureDetector(
          child: SvgPicture.asset(
            'assets/icon/telecharger.svg',
            width: 18,
          ),
        )
      ],
    );
  }
}

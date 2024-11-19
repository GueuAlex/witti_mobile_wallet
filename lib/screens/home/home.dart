import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:witti/config/constantes.dart';
import 'package:witti/widgets/app_header.dart';

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
                        Gap(5.0),
                        CreditCards(),
                        BuildIcons(),
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

class BuildIcons extends StatelessWidget {
  const BuildIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 3,
            height: 6,
            color: const Color.fromARGB(255, 209, 209, 209),
          ),
          const Gap(3),
          Container(
            width: 3,
            height: 6,
            color: const Color.fromARGB(255, 209, 209, 209),
          ),
          const Gap(3),
          Container(
            width: 3,
            height: 12,
            color: Constantes.blackColor,
          ),
          const Gap(3),
          Container(
            width: 3,
            height: 6,
            color: const Color.fromARGB(255, 209, 209, 209),
          ),
          const Gap(3),
          Container(
            width: 3,
            height: 6,
            color: const Color.fromARGB(255, 209, 209, 209),
          )
        ],
      ),
    );
  }
}

class CreditCards extends StatelessWidget {
  const CreditCards({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 195.0,
        //height: height,
        // viewportFraction: 1.0,
        enlargeCenterPage: true,
        autoPlay: false,
        autoPlayCurve: Curves.fastOutSlowIn,
        initialPage: 1,
        viewportFraction: 0.9,
        aspectRatio: 0.0,
        enlargeFactor: 0.15,
      ),
      items: [
        Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(16.0),
            image: const DecorationImage(
              image: AssetImage('assets/images/credit_card.png'),
              fit: BoxFit.cover,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF000000),
                offset: Offset.zero,
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
              BoxShadow(
                color: Color(0xFF000000),
                offset: Offset.zero,
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icon/witti-coin.svg',
                      width: 75,
                    ),
                    Text(
                      '0.000532 WC',
                      style: GoogleFonts.spaceGrotesk(
                        color: Constantes.greyColor,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/visa.png',
                      width: 45,
                    ),
                    const Gap(8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 198, 198, 198)
                                .withOpacity(0.25),
                          ),
                          child: Text(
                            '---- ---- 8790',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spaceGrotesk(
                              color: Colors.white,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          '23/10',
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ],
    );
  }
}

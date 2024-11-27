import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../panier/panier_screen.dart';

class SpinnerContainer extends StatefulWidget {
  final Widget child;
  final double size;
  final Color color;

  const SpinnerContainer({
    super.key,
    required this.child,
    this.size = 50,
    this.color = Colors.blue,
  });

  @override
  _SpinnerContainerState createState() => _SpinnerContainerState();
}

class _SpinnerContainerState extends State<SpinnerContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _text = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    // Arrête l'animation après 5 secondes
    Future.delayed(const Duration(seconds: 5), () {
      _controller.stop();
      _text += 1;
      _isLoading = false;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!_isLoading) {
          Navigator.pushNamed(context, PanierScreen.routeName);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: widget.size,
                height: widget.size,
                child: _isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(widget.color),
                        strokeWidth: 3,
                      )
                    : null,
              ),
              SvgPicture.asset('assets/icon/panier.svg'),
              Positioned(
                // left: 0,
                top: 5,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 192, 24, 12),
                      shape: BoxShape.circle),
                  child: Text(
                    _text.toString(),
                    style: GoogleFonts.spaceGrotesk(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

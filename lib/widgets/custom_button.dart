import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.color,
    required this.width,
    required this.height,
    required this.radius,
    required this.text,
    required this.onPress,
    this.fontsize = 0,
    this.isSetting = false,
    this.textColor = Colors.white,
    super.key,
  });

  final Color color;
  final double radius, width, height, fontsize;
  final String text;
  final bool isSetting;
  final Future<void> Function() onPress;
  final Color textColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isLoading = false;

  Future<void> _handlePress() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPress();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handlePress,
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          backgroundColor: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        ),
        child: _isLoading
            ? const CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor: Colors.white,
              )
            : Text(
                widget.text,
                textAlign: TextAlign.center,
                style: !widget.isSetting
                    ? Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: widget.textColor)
                    : Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: widget.fontsize,
                          color: widget.textColor,
                        ),
              ),
      ),
    );
  }
}

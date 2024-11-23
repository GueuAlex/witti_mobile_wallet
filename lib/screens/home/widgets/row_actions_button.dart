import 'package:flutter/material.dart';

import '../../../models/action_buttons.dart';
import 'action_button_widget.dart';

class RowActionsButtons extends StatelessWidget {
  const RowActionsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: ActionButton.buttons
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ActionButtonWidget(actionButton: e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

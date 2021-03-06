import 'package:flutter/material.dart';

import '../../../uitls/app_colors.dart';
import '../../../uitls/app_fonts.dart';

class Button extends StatefulWidget {
  final Color background;
  final VoidCallback onTab;
  final Color borderColor;
  final double minWidth;

  // Label
  final String label;
  final Color labelColor;
  final double? fontSize;
  final Function? labelWidget;

  // Icon
  final IconData? icon;
  final Color iconColor;
  final bool isIconRight;
  final EdgeInsets padding;

  const Button(
      {Key? key,
      required this.label,
      required this.onTab,
      this.labelColor = Colors.white,
      this.fontSize,
      this.borderColor = Colors.transparent,
      this.labelWidget,
      this.icon,
      this.isIconRight = true,
      this.background = AppColors.blue,
      this.iconColor = Colors.white,
      this.minWidth = 380,
      this.padding = const EdgeInsets.all(20)})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Button();
  }
}

class _Button extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: widget.minWidth,
        height: 40,
        padding: EdgeInsets.only(top: 14, bottom: 14),
        disabledColor: AppColors.gray_text_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: widget.borderColor),
        ),
        child: Padding(
          padding: widget.padding,
          child: RaisedButton(
              onPressed: widget.onTab,
              color: widget.background,
              child: Row(
                mainAxisAlignment: (widget.icon != null)
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.icon != null)
                    Icon(widget.icon, color: widget.background),
                  _buttonLabel(),
                  if (widget.icon != null)
                    Icon(
                      widget.icon,
                      color: widget.iconColor,
                    )
                ],
              )),
        ));
  }

  Widget _buttonLabel() {
    return Text(
      widget.label,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: (widget.fontSize == null) ? 20 : widget.fontSize,
          color: widget.labelColor,
          fontFamily: AppFonts.regular),
    );
  }
}

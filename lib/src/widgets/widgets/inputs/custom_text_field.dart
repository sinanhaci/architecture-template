import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/extensions/color_extensions.dart';
import '../../../../core/widgets/text_widgets/text_widgets.dart';
import '../../constants/constants_widgets.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String textFieldTitle;
  final Widget? suffixIcon;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;
  final TextCapitalization? textCapitalization;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final bool obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? borderColor;
  final String? Function(String?)? validator;
  final bool errorStatus;
  final bool isPassword;
  final bool autoFocus;
  final String? prefixText;
  final Function()? onTap;
  final TextStyle? style;
  const CustomTextField({
    this.margin,
    this.onTap,
    this.prefixText,
    this.autoFocus = false,
    this.isPassword = false,
    required this.hintText,
    this.errorStatus = false,
    this.validator,
    Key? key,
    this.borderColor,
    this.color,
    this.padding,
    this.textCapitalization,
    required this.controller,
    required this.focusNode,
    this.textInputAction,
    this.onSubmitted,
    this.onChanged,
    this.keyboardType,
    this.inputFormatter,
    this.textFieldTitle = '',
    this.suffixIcon,
    this.enabled,
    this.maxLines,
    this.minLines,
    this.obscureText = false,
    this.maxLength,
    this.contentPadding,
    this.style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding:padding ?? ConstantsWidget.onlyLeftRightPadding_35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFieldTitle == ''
              ? const SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(textFieldTitle,color: errorStatus ? theme.colorScheme.error :  theme.colorScheme.primary.withOpacity(0.8),),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
          Container(
            margin: margin ?? const EdgeInsets.only(
              bottom: 20
            ),
            height: maxLines == 1 ?50:null,
            decoration: const BoxDecoration(
              borderRadius: ConstantsWidget.borderRadius_20,
            ),
            child: TextFormField(
              onTap: onTap,
              autofocus: autoFocus,
              validator: validator,
              enabled: enabled,
              maxLines: maxLines,
              minLines: minLines,
              obscureText: obscureText,
              textCapitalization:
                  textCapitalization ?? TextCapitalization.sentences,
              maxLength: maxLength,
              inputFormatters: inputFormatter ?? [
                //if(!isPassword && Platform.isIOS)
                //UpperCaseTextFormatter(),
              ],
              onChanged: onChanged ?? (value) {},
              onFieldSubmitted: onSubmitted ?? (value) {},
              keyboardType: keyboardType,
              controller: controller,
              focusNode: focusNode,
              textInputAction: textInputAction ?? TextInputAction.done,
              cursorColor: theme.colorScheme.primary,
              style: style ??  theme.textTheme.displaySmall!.apply(color: theme.colorScheme.primary),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                prefixText: prefixText,
                prefixStyle: theme.textTheme.displaySmall!.apply(color: theme.colorScheme.primary),
                errorStyle: TextStyle(
                  color: theme.colorScheme.error,
                  height: 0,
                ),
                contentPadding: contentPadding ?? const EdgeInsets.only(left: 20, right: 20),
                counterText: '',
                suffixIcon: suffixIcon,
                focusColor: theme.colorScheme.defaultInputBackgroundColor,
                hintStyle: theme.textTheme.displaySmall!.apply(color: theme.colorScheme.primary.withOpacity(0.5)),
                border: errorStatus ? _errorBorder(context,theme): _textFieldBorder(context,theme),
                focusedBorder:errorStatus ? _errorBorder(context,theme): _textFieldBorder(context,theme),
                enabledBorder: errorStatus ? _errorBorder(context,theme): _textFieldBorder(context,theme),
                disabledBorder: errorStatus ? _errorBorder(context,theme): _textFieldBorder(context,theme),
                hintText: hintText,
                fillColor: color ?? theme.colorScheme.defaultInputBackgroundColor,
                hoverColor: color ?? theme.colorScheme.defaultInputBackgroundColor,
                filled: true
              
              ),
            ),
          ),
        ],
      ),
    );
  }

  _textFieldBorder(BuildContext context,ThemeData theme) {
    return OutlineInputBorder(
        borderRadius: ConstantsWidget.borderRadius_20,
        borderSide: BorderSide(color: borderColor ?? theme.colorScheme.defaultInputBackgroundColor));
  }

  _errorBorder(BuildContext context,ThemeData theme) {
    return OutlineInputBorder(
        borderRadius: ConstantsWidget.borderRadius_20,
        borderSide: BorderSide(color: theme.colorScheme.error));
  }
}

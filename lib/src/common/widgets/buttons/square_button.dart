import '../../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/extensions/color_extensions.dart';
import '../../../../core/widgets/image_viewer/image_viewer.dart';



class SquareButton extends StatelessWidget {
  final IconData? icon;
  final Function onTap;
  final String? svgIcon;
  final String? networkImage;
  final Color? color;
  final Color? backgroundColor;
  final bool centerDisable;
  final String? assetImage;
  const SquareButton(
      {Key? key,
      this.backgroundColor,
      this.centerDisable =false,
      this.color,
      this.networkImage,
      this.icon,
      required this.onTap,
      this.assetImage,
      this.svgIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backgroundColor ?? theme.colorScheme.scaffoldBackround,
            borderRadius: context.radiusLow),
        child: _returnedWidget(context,theme),
      ),
    );
  }

  _returnedWidget(BuildContext context, ThemeData theme) {
    if (icon != null) {
      return Icon(
        icon,
        size: 20,
        color: color?? theme.colorScheme.primary,
      );
    } else if (svgIcon != null) {
      return centerDisable ?SvgPicture.asset(svgIcon!,theme: SvgTheme(currentColor: color),): Center(
        child: SvgPicture.asset(svgIcon!,theme: SvgTheme(currentColor: color),),
      );
    } else if(networkImage != null){
      return ClipRRect(
        borderRadius: context.radiusLow,
        child: CustomNetworkImage(
          imagePath: networkImage,
          boxFit: BoxFit.cover,
        ),
      );
    }else{
      return centerDisable ?Image.asset(assetImage!,color: color,): Center(
        child: Image.asset(assetImage!,color: color,),
      );
    }
  }
}

import 'package:flutter/material.dart';

enum FontWeightEnum{
  normal,
  bold
}



class SmallText extends StatelessWidget {
  final String content;
  final Color? color;
  final FontWeightEnum fontWeightEnum;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  const SmallText(this.content,{super.key,this.color,this.fontWeightEnum = FontWeightEnum.normal,this.overflow,this.textAlign,this.maxLines});


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = const TextStyle();
    switch (fontWeightEnum) {
      case FontWeightEnum.normal:
        style = theme.textTheme.displaySmall!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
      case FontWeightEnum.bold:
        style = theme.textTheme.headlineSmall!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
    }
    return Text(content, style:style,textAlign: textAlign,maxLines: maxLines,overflow: overflow,);
  }
}



class MediumText extends StatelessWidget {
  final String content;
  final Color? color;
  final FontWeightEnum fontWeightEnum;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  const MediumText(this.content,{super.key,this.color,this.fontWeightEnum = FontWeightEnum.normal,this.overflow,this.textAlign,this.maxLines});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = const TextStyle();
    switch (fontWeightEnum) {
      case FontWeightEnum.normal:
        style = theme.textTheme.displayMedium!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
      case FontWeightEnum.bold:
        style = theme.textTheme.headlineMedium!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
    }
    return Text(content, style:style,textAlign: textAlign,maxLines: maxLines,overflow: overflow,);
  }
}

class LargeText extends StatelessWidget {
  final String content;
  final Color? color;
  final FontWeightEnum fontWeightEnum;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  const LargeText(this.content,{super.key,this.color,this.fontWeightEnum = FontWeightEnum.normal,this.overflow,this.textAlign,this.maxLines});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = const TextStyle();
    switch (fontWeightEnum) {
      case FontWeightEnum.normal:
        style = theme.textTheme.displayLarge!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
      case FontWeightEnum.bold:
        style = theme.textTheme.headlineLarge!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
    }
    return Text(content, style:style,textAlign: textAlign,maxLines: maxLines,overflow: overflow,);
  }
}


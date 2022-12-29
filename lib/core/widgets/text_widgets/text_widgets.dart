import 'package:flutter/material.dart';

enum FontWeightEnum{
  normal,
  bold
}

class XSmallText extends StatelessWidget {
  final String content;
  final Color? color;
  final FontWeightEnum fontWeightEnum;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  const XSmallText(this.content,{super.key,this.color,this.fontWeightEnum = FontWeightEnum.normal,this.overflow,this.textAlign,this.maxLines,});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = const TextStyle();
    switch (fontWeightEnum) {
      case FontWeightEnum.normal:
        style = theme.textTheme.headline6!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
      case FontWeightEnum.bold:
        style = theme.textTheme.overline!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
    }
    return Text(content, style:style,textAlign: textAlign,maxLines: maxLines,overflow: overflow,);
  }
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
        style = theme.textTheme.headline5!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
      case FontWeightEnum.bold:
        style = theme.textTheme.caption!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
    }
    return Text(content, style:style,textAlign: textAlign,maxLines: maxLines,overflow: overflow,);
  }
}

class NormalText extends StatelessWidget {
  final String content;
  final Color? color;
  final FontWeightEnum fontWeightEnum;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  const NormalText(this.content,{super.key,this.color,this.fontWeightEnum = FontWeightEnum.normal,this.overflow,this.textAlign,this.maxLines});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = const TextStyle();
    switch (fontWeightEnum) {
      case FontWeightEnum.normal:
        style = theme.textTheme.headline4!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
      case FontWeightEnum.bold:
        style = theme.textTheme.bodyText2!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
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
        style = theme.textTheme.headline3!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
      case FontWeightEnum.bold:
        style = theme.textTheme.bodyText1!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
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
        style = theme.textTheme.headline2!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
      case FontWeightEnum.bold:
        style = theme.textTheme.subtitle2!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
    }
    return Text(content, style:style,textAlign: textAlign,maxLines: maxLines,overflow: overflow,);
  }
}

class XLargeText extends StatelessWidget {
  final String content;
  final Color? color;
  final FontWeightEnum fontWeightEnum;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  const XLargeText(this.content,{super.key,this.color,this.fontWeightEnum = FontWeightEnum.normal,this.overflow,this.textAlign,this.maxLines});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = const TextStyle();
    switch (fontWeightEnum) {
      case FontWeightEnum.normal:
        style = theme.textTheme.headline1!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
      case FontWeightEnum.bold:
        style = theme.textTheme.subtitle1!.apply(color: color ?? theme.colorScheme.primary,overflow: overflow);
        break;
    }
    return Text(content, style:style,textAlign: textAlign,maxLines: maxLines,overflow: overflow,);
  }
}
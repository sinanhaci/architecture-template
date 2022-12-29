import 'package:flutter/material.dart';
import '../../../core/localization/localization_controller.dart';
import '../../../core/widgets/native_widgets/native_widgets.dart';
import '../../../core/widgets/text_widgets/text_widgets.dart';
import '../../../src/widgets/constants/constants_widgets.dart';


class BaseFuturebuilder<T> extends StatelessWidget {
  final Future<T>? future;
  final Widget Function(T data) hasData;
  final Widget Function(String error)? hasError;
  final Widget? loadingWidget;
  final Widget? otherWidget;
  const BaseFuturebuilder(
      {Key? key,
      this.otherWidget,
      required this.future,
      required this.hasData,
      this.hasError,
      this.loadingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingWidget ?? const FutureLoadingStatusWidget();
        } else if (snapshot.hasError) {
          if (hasError != null) {
            return hasError!(snapshot.error.toString());
          } else {
            return FutureErrorStatusWidget(
              content: snapshot.error.toString(),
            );
          }
        } else if (snapshot.hasData) {
          return hasData(snapshot.data as T);
        } else {
          return otherWidget ?? const FutureOtherStatusWidget();
        }
      },
    );
  }
}

class FutureLoadingStatusWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const FutureLoadingStatusWidget({Key? key, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
        height: height ?? size.height * .7,
        width: width ?? size.width,
        child: NativeWidget.indicator());
  }
}

class FutureErrorStatusWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String? content;
  const FutureErrorStatusWidget(
      {Key? key, this.height, this.width, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: height ?? size.height * .7,
      width: width ?? size.width,
      child: Padding(
        padding: ConstantsWidget.onlyLeftRightPadding_35,
        child: Center(
          child: SmallText(
            content ?? tr.httpErrorOther,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class FutureOtherStatusWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String? content;
  const FutureOtherStatusWidget(
      {Key? key, this.height, this.width, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: height ?? size.height * .7,
      width: width ?? size.width,
      child: Padding(
        padding: ConstantsWidget.onlyLeftRightPadding_35,
        child: Center(
          child: SmallText(
            content ?? tr.httpErrorOther,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class FutureEmptyStatusWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String content;
  final Widget? widget;
  const FutureEmptyStatusWidget(
      {Key? key, this.height, this.width, required this.content, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: height ?? size.height * .7,
      width: width ?? size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: ConstantsWidget.onlyLeftRightPadding_35,
            child: SmallText(
              content,
              textAlign: TextAlign.center,
            ),
          ),
          widget ?? const SizedBox()
        ],
      ),
    );
  }
}

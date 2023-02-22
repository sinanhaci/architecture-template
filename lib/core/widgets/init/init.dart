import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:native_widgets/native_widgets.dart';
import '../../constants/strings/asset_constants.dart';
import '../../utilities/network_controller/no_network_widget.dart';
import '../../utilities/scroll_controller/scroll_controller.dart';
import '../global/global_controller.dart';

class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: ScrollConfiguration(
        behavior: const ScrollBehaviorModified(),
        child: Stack(
          children: [
            GestureDetector(
                onTap: () async =>
                    await MainController.instance.closeKeyboard(),
                child: child ?? const SizedBox()),
            const NoNetworkWidget(),
            ValueListenableBuilder<bool>(
              valueListenable: MainController.instance.loadingStatus,
              builder: (context, bool status, Widget? child) {
                return status
                    ? NativeWidgets(context).nativeIndicator(
                        constructors: CustomIndicatorModel(
                            indicatorType: IndicatorType.inStack),
                      )
                    : const SizedBox();
              },
            ),
            ValueListenableBuilder<EdgeInsets>(
              valueListenable: MainController.instance.keyboardListener,
              builder: (context, EdgeInsets status, Widget? child) {
                return AnimatedPositioned(
                  key: const Key('KeyboardApparatus'),
                  right: 5,
                  bottom: status.bottom,
                  duration: const Duration(milliseconds: 0),
                  child: status.bottom < 100
                      ? const SizedBox()
                      : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () => MainController.instance.closeKeyboard(),
                            child: SvgPicture.asset(
                              CoreAssetConstants.keyboardHideSvg,
                              theme: SvgTheme(currentColor: Theme.of(context).colorScheme.primary),
                              height: 30,
                            ),
                          ),
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}



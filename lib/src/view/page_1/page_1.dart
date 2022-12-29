import '../../../core/localization/localization_controller.dart';
import '../../../core/widgets/text_widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import '../../../core/log/page_logger/log_model.dart';
import '../../../core/base/base_view.dart';
import '../../controller/page_1/page_1_controller.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<Page1Controller>(
      controller: Page1Controller(),
      pageLoggerKeys: PageLoggerKeys.page1,
      onModelReady: (controller) {
        controller.setContext(context);
        controller.init();
      },
      onDispose: (controller) {
        controller.dispose();
      },
      onPageBuilder: (context, controller) {
        return Scaffold(
          body: Center(
            child: SmallText(tr.bottomPage1),
          ),
        );
      },
    );
  }
}

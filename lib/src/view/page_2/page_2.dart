import 'package:flutter/material.dart';
import '../../../core/localization/localization_controller.dart';
import '../../../core/log/page_logger/log_model.dart';
import '../../../core/widgets/text_widgets/text_widgets.dart';
import '../../controller/page_3/page_3_controller.dart';
import '../../../core/base/base_view.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<Page3Controller>(
      controller: Page3Controller(),
      pageLoggerKeys: PageLoggerKeys.page2,
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
            child: SmallText(tr.bottomPage2),
          ),
        );
      },
    );
  }
}

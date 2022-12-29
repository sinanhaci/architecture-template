import 'package:flutter/material.dart';
import '../../../core/localization/localization_controller.dart';
import '../../../core/log/page_logger/log_model.dart';
import '../../../core/base/base_view.dart';
import '../../../core/widgets/text_widgets/text_widgets.dart';
import '../../controller/page_5/page_5_controller.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<Page5Controller>(
      controller: Page5Controller(),
      pageLoggerKeys: PageLoggerKeys.page5,
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
            child: SmallText(tr.bottomPage5),
          ),
        );
      },
    );
  }
}

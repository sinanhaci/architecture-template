import 'package:flutter/material.dart';
import '../../../core/localization/localization_controller.dart';
import '../../../core/log/page_logger/log_model.dart';
import '../../../core/base/base_view.dart';
import '../../../core/widgets/text_widgets/text_widgets.dart';
import '../../controller/page_4/page_4_controller.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<Page4Controller>(
      controller: Page4Controller(),
      pageLoggerKeys: PageLoggerKeys.page4,
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
            child: SmallText(tr.bottomPage4),
          ),
        );
      },
    );
  }
}

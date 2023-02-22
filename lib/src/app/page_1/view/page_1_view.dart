import 'package:core_project/src/app/page_1/view_model/page_1_view_model.dart';

import '../../../../core/localization/localization_controller.dart';
import '../../../../core/widgets/text_widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import '../../../../core/log/page_logger/log_model.dart';
import '../../../../core/base/base_view.dart';

class Page1View extends StatelessWidget {
  const Page1View({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<Page1ViewModel>(
      viewModel: Page1ViewModel(),
      onLoggerKey: PageLoggerKeys.page1,
      onInit: (controller) {
        controller.setContext(context);
        controller.init();
      },
      onDispose: (controller) {
        controller.dispose();
      },
      onView: (context, controller) {
        return Scaffold(
          body: Center(
            child: SmallText(tr.bottomPage1),
          ),
        );
      },
    );
  }
}

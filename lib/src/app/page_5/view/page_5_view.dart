import 'package:core_project/src/app/page_5/view_model/page_5_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/localization_controller.dart';
import '../../../../core/log/page_logger/log_model.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/widgets/text_widgets/text_widgets.dart';

class Page5View extends StatelessWidget {
  const Page5View({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<Page5ViewModel>(
      viewModel: Page5ViewModel(),
      onLoggerKey: PageLoggerKeys.page5,
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
            child: SmallText(tr.bottomPage5),
          ),
        );
      },
    );
  }
}

import 'package:core_project/src/app/page_4/view_model/page_4_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/localization_controller.dart';
import '../../../../core/log/page_logger/log_model.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/widgets/text_widgets/text_widgets.dart';

class Page4View extends StatelessWidget {
  const Page4View({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<Page4ViewModel>(
      viewModel: Page4ViewModel(),
      onLoggerKey: PageLoggerKeys.page4,
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
            child: SmallText(tr.bottomPage4),
          ),
        );
      },
    );
  }
}

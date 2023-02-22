import 'package:core_project/src/app/page_2/view_model/page_2_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/localization_controller.dart';
import '../../../../core/log/page_logger/log_model.dart';
import '../../../../core/widgets/text_widgets/text_widgets.dart';
import '../../../../core/base/base_view.dart';

class Page2View extends StatelessWidget {
  const Page2View({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<Page2ViewModel>(
      viewModel: Page2ViewModel(),
      onLoggerKey: PageLoggerKeys.page2,
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
            child: SmallText(tr.bottomPage2),
          ),
        );
      },
    );
  }
}

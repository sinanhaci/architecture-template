
import 'package:flutter/material.dart';
import '../../../core/log/page_logger/log_model.dart';
import '../../controller/nav_bar/nav_bar_controller.dart';
import '../page_1/page_1.dart';
import '../page_2/page_2.dart';
import '../page_3/page_3.dart';
import '../page_4/page_4.dart';
import '../page_5/page_5.dart';
import '../../../core/base/base_view.dart';
import '../../../core/localization/localization_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }


  final String _page1 = tr.bottomPage1;
  final String _page2 = tr.bottomPage2;
  final String _page3 = tr.bottomPage3;
  final String _page4 = tr.bottomPage4;
  final String _page5 = tr.bottomPage5;


  final IconData _page1Icon = Icons.home;
  final IconData _page2Icon = Icons.storefront_rounded;
  final IconData _page3Icon = Icons.qr_code_scanner;
  final IconData _page4Icon = Icons.wallet;
  final IconData _page5Icon = Icons.person;



  @override
  Widget build(BuildContext context) {
    return BaseView<NavBarController>(
      controller: NavBarController(),
      pageLoggerKeys: PageLoggerKeys.navBar,
      onModelReady: (controller) {
        controller.setContext(context);
        controller.init();
      },
      onDispose: (controller) {
        controller.dispose();
      },
      onPageBuilder: (context, controller) {
        return Scaffold(
          bottomNavigationBar: Material(
            elevation: 15,
            color: controller.theme.scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: radius,
            ),
            child: SafeArea(
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  color: controller.theme.scaffoldBackgroundColor,
                  borderRadius: radius,
                ),
                child: _tabBar(controller),
              ),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children:_tabViews
          ),
        );
      },
    );
  }

  void _onTap(index) {}

  List<Widget> get _tabViews {
    return const [
      Page1(),
      Page2(),
      Page3(),
      Page4(),
      Page5()
    ];
  }

  List<Widget> get _tabs {
    return [
      _navBarItem(title: _page1,icon: _page1Icon),
      _navBarItem(title: _page2,icon: _page2Icon),
      _navBarItem(title: _page3,icon: _page3Icon),
      _navBarItem(title: _page4,icon: _page4Icon),
      _navBarItem(title: _page5,icon: _page5Icon),
    ];
  }




  TabBar _tabBar(NavBarController controller) {
    return TabBar(
      splashBorderRadius: radius,
      labelColor: controller.theme.colorScheme.primary,
      unselectedLabelColor: controller.theme.colorScheme.inversePrimary,
      labelStyle: controller.theme.textTheme.displaySmall,
      unselectedLabelStyle: controller.theme.textTheme.displaySmall,
      labelPadding: const EdgeInsets.all(0),
      indicatorColor: Colors.transparent,
      onTap: _onTap,
      controller: tabController,
      tabs: _tabs,
    );
  }

  BorderRadius get radius => const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      );

  Widget _navBarItem({
    required IconData icon,
    required String title,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          FittedBox(fit: BoxFit.fill, child: Text(title)),
        ],
      ),
    );
  }
}

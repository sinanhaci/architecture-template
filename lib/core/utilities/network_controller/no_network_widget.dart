import '../../localization/localization_controller.dart';
import 'package:flutter/material.dart';
import '../../widgets/text_widgets/text_widgets.dart';
import 'network_change_controller.dart';
import 'network_status_manager.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({super.key});

  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget> with StateMixin {
  late final INetworkStatusManager _networkChange;
  NetworkResult? _networkResult = NetworkResult.on;
  @override
  void initState() {
    super.initState();
    _networkChange = NetworkChangeController();

    waitForScreen(() {
      _networkChange.handleNetworkChange((result) {
        _updateView(result);
      });
    });
  }

  Future<void> fetchFirstResult() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final result = await _networkChange.checkNetworkFirstTime();
      _updateView(result);
    });
  }

  void _updateView(NetworkResult result) {
    setState(() {
      _networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 350),
      curve: Curves.bounceIn,
      bottom: _networkResult == NetworkResult.on ? -100 : 120,
      left: 35,
      right: 35,
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          setState(() {
            _networkResult = NetworkResult.on;
          });
        },
        direction: DismissDirection.vertical,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _networkResult = NetworkResult.off;
            });
          },
          child: Material(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.colorScheme.onBackground),
              child: Row(
                children: [
                  Icon(
                    Icons.priority_high,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(child: XSmallText(tr.networkStatusOff))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}

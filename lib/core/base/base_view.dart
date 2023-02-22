
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../log/page_logger/log_model.dart';
import '../widgets/global/global_controller.dart';
import 'base_state.dart';


class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onView;
  final T viewModel;
  final Function(T model) onInit;
  final Function(T model)? onDispose;
  final Function(T model, AppLifecycleState)? onAppLifecycyleState;
  final Function(T model, TickerProvider)? onTickerProvider;
  final PageLoggerKeys onLoggerKey;
  final bool backgroundView;

  const BaseView(
      {Key? key,
      this.backgroundView = true,
      required this.onLoggerKey,
      required this.viewModel,
      required this.onView,
      required this.onInit,
      this.onAppLifecycyleState,
      this.onTickerProvider,
      this.onDispose})
      : super(key: key);

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends BaseState<BaseView<T>> {

  late T model;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    model = widget.viewModel;
    widget.onInit(model);
    if (widget.onTickerProvider != null) {
      widget.onTickerProvider!(model, this);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _listenKeyboardSize();
    return widget.onView(context,model);
  }

 void _listenKeyboardSize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MainController.instance.keyboardListener.value = EdgeInsets.fromWindowPadding(
        WidgetsBinding.instance.window.viewInsets,
        WidgetsBinding.instance.window.devicePixelRatio,
      );
    });
  }

  
  @override
  Function? get onDispose => (){
    WidgetsBinding.instance.removeObserver(this);
    widget.onDispose != null ? widget.onDispose!(model) : null;
  };



  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.onDispose?.call(model);
    super.dispose();
  }


  @override
  PageLoggerKeys get key => widget.onLoggerKey;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(widget.onAppLifecycyleState != null){
      widget.onAppLifecycyleState!(model,state);
    }
  }

}
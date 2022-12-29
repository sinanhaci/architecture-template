
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../log/page_logger/log_model.dart';
import '../widgets/global/global_controller.dart';
import 'base_state.dart';
import '../log/page_logger/logger_mixin.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T controller;
  final Function(T model) onModelReady;
  final Function(T model)? onDispose;
  final PageLoggerKeys pageLoggerKeys;

  const BaseView(
      {Key? key,
      required this.pageLoggerKeys,
      required this.controller,
      required this.onPageBuilder,
      required this.onModelReady,
      this.onDispose})
      : super(key: key);

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends BaseState<BaseView<T>> with LoggerMixin {
  late T model;
  @override
  void initState() {
    model = widget.controller;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _listenKeyboardSize();
    return widget.onPageBuilder(context, model);
  }

  void _listenKeyboardSize() {
    return WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    MainController.instance.keyboardListener.value = EdgeInsets.fromWindowPadding(
      WidgetsBinding.instance.window.viewInsets,
      WidgetsBinding.instance.window.devicePixelRatio);
    });
  }

  @override
  PageLoggerKeys get key => widget.pageLoggerKeys;
  
  @override
  Function? get onDispose => (){
    widget.onDispose != null ? widget.onDispose!(model) : null;
  };
}
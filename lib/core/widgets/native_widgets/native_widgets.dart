import 'package:flutter/cupertino.dart';
import 'package:native_widgets/native_widgets.dart';
import '../../localization/localization_controller.dart';
import '../../navigation/navigation_service.dart';

class NativeWidget {
  static final NativeWidgets _nativeWidgets = NativeWidgets(
    //TODO: STYLE
    NavigationService.instance.navigatorKey.currentContext!,
    actionSheetTheme: CustomActionSheetTheme(),
    buttonTheme: CustomButtonTheme(),
    indicatorTheme: CustomIndicatorTheme(),
    switchTheme: CustomSwitchTheme(),
  );

  static Widget indicator({IndicatorType indicatorType = IndicatorType.center}) {
    return _nativeWidgets.nativeIndicator(constructors: CustomIndicatorModel(indicatorType: indicatorType,),);
  }

  static Widget nSwitch({required bool value,void Function(bool)? onChanged,Color? color,Color? thumbColor,Color? trackColor}) {
    return _nativeWidgets.nativeSwitch(constructors: CustomSwitchModel(value: value,onChanged: onChanged,));
  }

  static Future<dynamic> dialog({required String title,required String content,required Function? onPress,String? okButtonText,bool isDefaultAction = false,bool isDestructiveAction = false,ButtonProperties? cancelButtonProperties,DialogInputProperties? inputProperties,DialogType dialogType = DialogType.ok,
  }) async {
    return await _nativeWidgets.nativeDialog(
      constructors: DialogModel(
        title: title,
        content: content,
        okButtonProperties: ButtonProperties(
          buttonText: okButtonText ?? tr.done,
          onPress: () async {
            if (onPress != null) return await onPress();
            Navigator.pop(
                NavigationService.instance.navigatorKey.currentContext!);
          },
          isDefaultAction: isDefaultAction,
          isDestructiveAction: isDestructiveAction,
        ),
        cancelButtonProperties: cancelButtonProperties,
        dialogType: dialogType,
        inputProperties: inputProperties,
      ),
    );
  }

  static Future<DateTime?> dateTimePicker({required DateTime time,DatePickerDateOrder? dateOrder,DateTime? initialDateTime,DateTime? maximumDate,DateTime? minimumDate,DateTimePickerType? pickerType,int? maximumYear,int? minimumYear,
  }) async {
    return await _nativeWidgets.nativeDateTimePicker(
      constructors: DateTimePickerModel(
          time: time,
          dateOrder: dateOrder,
          initialDateTime: initialDateTime,
          maximumDate: maximumDate,
          minimumDate: minimumDate,
          pickerType: pickerType,
          maximumYear: maximumYear,
          minimumYear: minimumYear),
    );
  }

  static Future<dynamic> actionSheet({required List<ButtonProperties> actions,String? content,String? title,ButtonProperties? defaultButtonProperties,
  }) async {
    return await _nativeWidgets.nativeActionSheet(
      constructors: ActionSheetModel(
        actions: actions,
        content: content,
        title: title,
      ),
    );
  }

  static Widget refreshIndicator({int? itemCount,ScrollPhysics? physics,ScrollController? scrollController,bool shrinkWrap = false,required Future<void> Function() onRefresh,List<Widget>? children,Widget Function(BuildContext, int)? itemBuilder,
  }) {
    return _nativeWidgets.nativeRefreshIndicator(
      constructors: RefreshIndicatorModel(
        onRefresh: onRefresh,
        children: children,
        itemBuilder: itemBuilder,
        itemCount: itemCount,
        physics: physics,
        scrollController: scrollController,
        shrinkWrap: shrinkWrap,
      ),
    );
  }
}

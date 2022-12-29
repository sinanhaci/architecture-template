import '../localization/localization_controller.dart';


extension DateTimeExtension on DateTime? {
  String? weekdayName() {
    Map<int, String> weekdayName = {
      1: tr.monday,
      2: tr.tuesday,
      3: tr.wednesday,
      4: tr.thursday,
      5: tr.friday,
      6: tr.saturday,
      7: tr.sunday
    };
    return weekdayName[this!.weekday];
  }

  String getMonthString() {
    switch (this!.month) {
      case 1:
        return tr.january;
      case 2:
        return tr.february;
      case 3:
        return tr.march;
      case 4:
        return tr.april;
      case 5:
        return tr.may;
      case 6:
        return tr.june;
      case 7:
        return tr.july;
      case 8:
        return tr.august;
      case 9:
        return tr.september;
      case 10:
        return tr.october;
      case 11:
        return tr.november;
      case 12:
        return tr.december;
      default:
        return 'Err';
    }
  }

  String timeAgoByDateTime() {
    if (this != null) {
      var diff = DateTime.now().difference(this!);
      if (diff.inSeconds < 30) {
        return tr.now;
      } else if (diff.inSeconds < 60) {
        return tr.secondsAgo(diff.inSeconds.toString());
      } else if (diff.inMinutes < 60) {
        return tr.minuteAgo(diff.inMinutes.toString());
      } else if (diff.inHours < 24) {
        return tr.hourAgo(diff.inHours.toString());
      } else if (diff.inDays < 30) {
        return tr.dayAgo(diff.inDays.toString());
      } else {
        return '${this!.day} ${getMonthString()}';
      }
    } else {
      return '';
    }
  }

  String? getDateFormat_1(){
    return '${weekdayName()}, ${getMonthString()} ${this!.day}';
  }
  String? getDateFormat_2(){
    return '${this!.day} ${getMonthString()},  ${weekdayName()}';
  }
  String? getDateFormat_3(){
    return '${this!.day} ${getMonthString()} ${this!.year}';
  }
  String? getDateFormat_4(){
    return '${this!.day} ${getMonthString()}';
  }
}

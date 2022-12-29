// ignore_for_file: file_names

abstract class INavigationService {
  Future<void> navigateToPage({String? path, Object? data});
  Future<void> navigateToPageWidthDispose({String? path, Object? data});
  Future<void> navigateToPageClear({String? path, Object? data});
  Future<void> navigatorPop({Object? data});
}

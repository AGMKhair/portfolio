import 'package:flutter/foundation.dart';

class AppViewModel extends ChangeNotifier {
  String _title = 'Responsive App';

  String get title => _title;

  void updateTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }
}

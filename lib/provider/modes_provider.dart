
import 'package:flutter/foundation.dart';


class ModesProvider extends ChangeNotifier{  
  bool darkMode = false;
  void changeMode( bool val){
    darkMode = val;
    notifyListeners();
  }
}
import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = true;

  get pinned {
    return _pinned;
  }

  get snap {
    return _snap;
  }

  get floating {
    return _floating;
  }
}

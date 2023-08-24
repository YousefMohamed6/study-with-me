import 'package:flutter/foundation.dart';

bool plateform() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    return true;
  } else {
    return false;
  }
}




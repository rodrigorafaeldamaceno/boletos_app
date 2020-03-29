import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class HomeStore {
  void initOneSignal() {
    OneSignal.shared.init(DotEnv().env['ONE_SIGNAL_KEY'].toString());
    OneSignal.shared.setSubscription(true).then((value) {});

    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.none);
  }

  void disableOneSignal() async {
    await OneSignal.shared.setSubscription(false);
  }
}

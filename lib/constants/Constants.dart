import 'package:event_bus/event_bus.dart';

class Constants {
  static final String REDIRECT_URL = "http://yubo725.top/osc/osc.php";

  static final String LOGIN_URL = "https://www.oschina.net/action/oauth2/authorize?client_id=4rWcDXCNTV5gMWxtagxI&response_type=code&redirect_uri=" + REDIRECT_URL;

  static final String OSC_CLIENT_ID = "4rWcDXCNTV5gMWxtagxI";

  static final String END_LINE_TAG = "COMPLETE";

  static EventBus eventBus = new EventBus();

  static final List<String> Methods = ['get', 'post'];

}

class AppColors {
  static const DividerColor = 0xffd9d9d9;
}

class AppSizes {
  static const DividerWidth = 0.5;
}


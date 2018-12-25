import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
class DataUtils {
  static final String SP_COLOR_THEME_INDEX = 'colorThemeIndex';

  /// 设置选择的主题色索引
  static setColorTheme(int colorThemeIndex) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(SP_COLOR_THEME_INDEX, colorThemeIndex);
  }

  /// 获取主题色索引
  static Future<int> getColorThemeIndex() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(SP_COLOR_THEME_INDEX);
  } 
}
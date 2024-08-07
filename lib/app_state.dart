import 'package:flutter/material.dart';
import 'package:test_project/theme/theme.dart';

import 'favorite/favorite_page.dart';
import 'home.dart';
import 'map/map_home.dart';
import 'mypage/my_page.dart';
import 'order/order_list.dart';

class NavigationProvider with ChangeNotifier { // Bottom Navigation Bar를 Provider를 통해 전체 상태관리함.
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void navigateToIndex(BuildContext context, int index) { // index 별 페이지 정의.
    setSelectedIndex(index);
    switch (index) {
      case 0:
        _navigateWithoutAnimation(context, '/'); // 홈
        break;
      case 1:
        _navigateWithoutAnimation(context, '/favorite'); // 관심매장
        break;
      case 2:
        _navigateWithoutAnimation(context, '/map'); // 지도
        break;
      case 3:
        _navigateWithoutAnimation(context, '/order'); // 주문내역
        break;
      case 4:
        _navigateWithoutAnimation(context, '/mypage'); // 마이페이지
        break;
    }
  }

  void _navigateWithoutAnimation(BuildContext context, String routeName) { // 페이지 이동할때 생기는 애니메이션 효과 제거
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => _getPageByRouteName(context, routeName),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
          (route) => false,
    );
  }

  Widget _getPageByRouteName(BuildContext context, String routeName) { // 페이지 Get
    switch (routeName) {
      case '/':
        return const MyHomePage(title: "title");
      case '/favorite':
        return const FavoritePage();
      case '/map':
        return const MapHomePage();
      case '/order':
        return const OrderListPage();
      case '/mypage':
        return const MyPage();
      default:
        return const MyHomePage(title: "title");
    }
  }
}

class ThemeProvider with ChangeNotifier { // 테마 Provider / 라이트 모드, 다크 모드 설정 가능
  bool _isLightTheme = true;
  bool get isLightTheme => _isLightTheme;

  late ThemeData _lightTheme;
  late ThemeData _darkTheme;

  ThemeProvider(BuildContext context) {
    _lightTheme = ThemeData(useMaterial3: true, colorScheme: lightColorScheme, fontFamily: 'Pretendard');
    _darkTheme = ThemeData(useMaterial3: true, colorScheme: darkColorScheme, fontFamily: 'Pretendard');
  }

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;

  ThemeMode get themeMode => _isLightTheme ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }
}

class AutoLoginToggle extends StatefulWidget {
  @override
  _AutoLoginToggleState createState() => _AutoLoginToggleState();
}

class _AutoLoginToggleState extends State<AutoLoginToggle> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
          activeColor: Theme.of(context).colorScheme.primary,
          checkColor: Colors.white,
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        const Text(
          '자동 로그인',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
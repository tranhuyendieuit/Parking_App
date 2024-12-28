import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/presentation/screens/home/page/home_page.dart';
import 'package:mobile/presentation/screens/profile/page/profile_page.dart';
import 'package:mobile/presentation/screens/qr_scan/page/qr_scan_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Danh sách các trang, chỉ khởi tạo khi cần thiết
  final Map<int, Widget> _pages = {
    0: const HomePage(),
    1: const Center(child: Text("Category Page")),
    3: const Center(child: Text("Other Page")),
    4: const ProfilePage(),
  };

  // Hàm lấy trang hiện tại, với lazy loading cho QrScanPage
  Widget _getPage(int index) {
    if (!_pages.containsKey(index)) {
      if (index == 2) {
        _pages[index] = const QrScanPage();
      }
    }
    return _pages[index]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_currentIndex), 
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: AppColors.white,
        color: AppColors.mountainMeadow,
        buttonBackgroundColor: AppColors.mountainMeadow,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOutCirc,
        letIndexChange: (value) => true,
        index: _currentIndex,
        onTap: (selectIndex) {
          setState(() {
            _currentIndex = selectIndex;
          });
        },
        items: const [
          Icon(Icons.home, size: 30, color: AppColors.white),
          Icon(Icons.category, size: 30, color: AppColors.white),
          Icon(Icons.qr_code, size: 30, color: AppColors.white),
          Icon(Icons.search, size: 30, color: AppColors.white),
          Icon(Icons.person, size: 30, color: AppColors.white),
        ],
      ),
    );
  }
}

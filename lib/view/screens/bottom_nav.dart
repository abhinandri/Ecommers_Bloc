
import 'package:ecommers/controllers/blocs/bloc/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:ecommers/view/cart.dart';
import 'package:ecommers/view/screens/home_page.dart';
import 'package:ecommers/view/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Bottom_Nav extends StatelessWidget {
  Bottom_Nav({super.key});

  final List<Widget> _pages = [
     HomePage(),
     CartPage(),
      ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          if (state is BottomNavChanged) {
            return _pages[state.selectedIndex];
          }
          return _pages[0];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          int currentIndex =
              (state is BottomNavChanged) ? state.selectedIndex : 0;

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: BottomNavigationBar(
                  items: [
                    _buildNavItem(Icons.home_outlined, Icons.home, "Home"),
                    _buildNavItem(Icons.shopping_bag_outlined,
                        Icons.shopping_bag, "Cart"),
                    _buildNavItem(
                        Icons.person_outline, Icons.person, "Profile"),
                  ],
                  currentIndex: currentIndex,
                  onTap: (newIndex) {
                    context
                        .read<BottomNavBloc>()
                        .add(ChangeTab(newIndex: newIndex));
                  },
                  selectedItemColor: Colors.black87,
                  unselectedItemColor: Colors.black54,
                  selectedLabelStyle: GoogleFonts.quicksand(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: GoogleFonts.quicksand(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  showUnselectedLabels: true,
                  selectedIconTheme: const IconThemeData(size: 28),
                  unselectedIconTheme: const IconThemeData(size: 24),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      IconData unselectedIcon, IconData selectedIcon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(unselectedIcon),
      activeIcon: Icon(selectedIcon),
      label: label,
    );
  }
}

// Optional: Add this animation widget if you want smooth icon transitions
class NavIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Color color;

  const NavIcon({
    required this.icon,
    required this.isSelected,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.all(isSelected ? 12 : 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black.withOpacity(0.05) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: color,
        size: isSelected ? 28 : 24,
      ),
    );
  }
}

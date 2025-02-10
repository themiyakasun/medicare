import 'package:flutter/material.dart';
import 'package:medicare/features/patient/screens/dashboard/dashboard.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const PatientDashboardScreen(),
    const AppointmentsScreen(),
    const SearchScreen(),
    const MenuScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          left: TSizes.lg,
          right: TSizes.lg,
          bottom: TSizes.lg,
        ),
        decoration: BoxDecoration(
          color: TColors.darkPurple,
          borderRadius: BorderRadius.circular(TSizes.lg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavigationItem(
              icon: TImages.grid,
              label: 'Dashboard',
              isSelected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            _buildNavigationItem(
              icon: TImages.appointment,
              label: 'Appointments',
              isSelected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            _buildNavigationItem(
              icon: TImages.search,
              label: 'Search',
              isSelected: _selectedIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
            _buildNavigationItem(
              icon: TImages.menu,
              label: 'Menu',
              isSelected: _selectedIndex == 3,
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItem({
    required String icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(TSizes.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.sm),
          color: Colors.transparent,
        ),
        child: Padding(
          padding: EdgeInsets.all(TSizes.sm),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage(icon),
                width: 24,
                height: 24,
                color: TColors.neutralsWhite,
              ),
              if (label.isNotEmpty && isSelected) SizedBox(width: TSizes.sm),
              if (label.isNotEmpty && isSelected)
                Text(
                  label,
                  style: TextStyle(
                    color: TColors.neutralsWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Appointments Screen'));
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Search Screen'));
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Menu Screen'));
  }
}

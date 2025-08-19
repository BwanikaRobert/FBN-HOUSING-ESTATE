// widgets/bottom_navigation.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Tenants',
          ),
          NavigationDestination(
            icon: Icon(Icons.payment_outlined),
            selectedIcon: Icon(Icons.payment),
            label: 'Payments',
          ),
        ],
      ),
    );
  }
}

// Alternative Classic BottomNavigationBar Version
class ClassicBottomNavigationScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ClassicBottomNavigationScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Tenants',
            tooltip: 'View all tenants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment_outlined),
            activeIcon: Icon(Icons.payment),
            label: 'Payments',
            tooltip: 'View payment history',
          ),
        ],
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        elevation: 8,
      ),
    );
  }
}

// Enhanced Bottom Navigation with Badge Support
class EnhancedBottomNavigationScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final int? tenantCount;
  final int? paymentCount;

  const EnhancedBottomNavigationScaffold({
    super.key,
    required this.navigationShell,
    this.tenantCount,
    this.paymentCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: [
          NavigationDestination(
            icon: _buildIconWithBadge(
              Icons.people_outline,
              tenantCount,
              context,
            ),
            selectedIcon: _buildIconWithBadge(
              Icons.people,
              tenantCount,
              context,
              isSelected: true,
            ),
            label: 'Tenants',
          ),
          NavigationDestination(
            icon: _buildIconWithBadge(
              Icons.payment_outlined,
              paymentCount,
              context,
            ),
            selectedIcon: _buildIconWithBadge(
              Icons.payment,
              paymentCount,
              context,
              isSelected: true,
            ),
            label: 'Payments',
          ),
        ],
      ),
    );
  }

  Widget _buildIconWithBadge(
    IconData icon,
    int? count,
    BuildContext context, {
    bool isSelected = false,
  }) {
    if (count == null || count == 0) {
      return Icon(icon);
    }

    return Badge(
      label: Text(
        count > 99 ? '99+' : count.toString(),
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
      backgroundColor: isSelected
          ? Theme.of(context).colorScheme.primary
          : Colors.red,
      child: Icon(icon),
    );
  }
}

// Bottom Navigation with Floating Action Button Integration
class BottomNavigationWithFABScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final VoidCallback? onFabPressed;
  final String? fabTooltip;

  const BottomNavigationWithFABScaffold({
    super.key,
    required this.navigationShell,
    this.onFabPressed,
    this.fabTooltip,
  });

  @override
  Widget build(BuildContext context) {
    // Show FAB only on payments tab
    final showFab = navigationShell.currentIndex == 1;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Tenants',
          ),
          NavigationDestination(
            icon: Icon(Icons.payment_outlined),
            selectedIcon: Icon(Icons.payment),
            label: 'Payments',
          ),
        ],
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              onPressed: onFabPressed,
              tooltip: fabTooltip ?? 'Add Payment',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

// Bottom Navigation with Custom Theme
class ThemedBottomNavigationScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ThemedBottomNavigationScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          backgroundColor: colorScheme.surface,
          indicatorColor: colorScheme.primaryContainer,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.people_outline),
              selectedIcon: Icon(
                Icons.people,
                color: colorScheme.onPrimaryContainer,
              ),
              label: 'Tenants',
            ),
            NavigationDestination(
              icon: const Icon(Icons.payment_outlined),
              selectedIcon: Icon(
                Icons.payment,
                color: colorScheme.onPrimaryContainer,
              ),
              label: 'Payments',
            ),
          ],
        ),
      ),
    );
  }
}

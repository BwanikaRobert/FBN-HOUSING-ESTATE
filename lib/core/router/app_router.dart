import 'package:fbn/core/constants/app_constants.dart';
import 'package:fbn/core/router/widgets/bottom_scafold.dart';
import 'package:fbn/features/payments/presentation/pages/add_payments.dart';
import 'package:fbn/features/payments/presentation/pages/payments_page.dart';
import 'package:fbn/features/tenants/presentation/pages/tenant_details_page.dart';
import 'package:fbn/features/tenants/presentation/pages/tenants_page.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fbn/features/tenants/domain/entities/tenants.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppConstants.tenantsPath,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavigationScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppConstants.tenantsPath,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: TenantsPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppConstants.paymentsPath,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: PaymentsPage()),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppConstants.tenantDetailsPath,
        builder: (context, state) {
          final tenant = state.extra as Tenant;
          return TenantDetailsPage(tenant: tenant);
        },
      ),
      GoRoute(
        path: AppConstants.addPaymentPath,
        builder: (context, state) => const AddPaymentPage(),
      ),
    ],
  );
});

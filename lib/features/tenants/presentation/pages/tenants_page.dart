import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../providers/tenant_providers.dart';
import '../widgets/tenant_tile.dart';

class TenantsPage extends ConsumerWidget {
  const TenantsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tenantsAsync = ref.watch(tenantsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenants'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: tenantsAsync.when(
        data: (tenants) {
          if (tenants.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_outline, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No tenants found'),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(tenantsProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: tenants.length,
              itemBuilder: (context, index) {
                final tenant = tenants[index];
                return TenantTile(
                  tenant: tenant,
                  onTap: () {
                    context.push(AppConstants.tenantDetailsPath, extra: tenant);
                  },
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(tenantsProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

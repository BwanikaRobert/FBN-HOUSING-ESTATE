import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/supabase_provider.dart';
import '../../data/repositories/tenant_repository.dart';
import '../../data/services/tenant_service.dart';
import 'package:fbn/features/tenants/domain/entities/tenants.dart';

final tenantServiceProvider = Provider<TenantService>((ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return TenantService(supabaseClient);
});

final tenantRepositoryProvider = Provider<TenantRepository>((ref) {
  final tenantService = ref.watch(tenantServiceProvider);
  return TenantRepository(tenantService);
});

final tenantsProvider = FutureProvider<List<Tenant>>((ref) async {
  final repository = ref.watch(tenantRepositoryProvider);
  return await repository.getTenants();
});

final tenantByIdProvider = FutureProvider.family<Tenant?, String>((
  ref,
  id,
) async {
  final repository = ref.watch(tenantRepositoryProvider);
  return await repository.getTenantById(id);
});

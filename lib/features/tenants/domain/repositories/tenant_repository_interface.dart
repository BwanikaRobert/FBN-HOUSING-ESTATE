import 'package:fbn/features/tenants/domain/entities/tenants.dart';

abstract class TenantRepositoryInterface {
  Future<List<Tenant>> getTenants();
  Future<Tenant?> getTenantById(String id);
  Future<Tenant?> updateTenant(String id);
  Stream<List<Tenant>> watchTenants();
}

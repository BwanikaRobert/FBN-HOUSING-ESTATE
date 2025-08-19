import 'package:fbn/features/tenants/domain/entities/tenants.dart';

abstract class TenantRepositoryInterface {
  Future<List<Tenant>> getTenants();
  Future<Tenant?> getTenantById(String id);
  Stream<List<Tenant>> watchTenants();
}

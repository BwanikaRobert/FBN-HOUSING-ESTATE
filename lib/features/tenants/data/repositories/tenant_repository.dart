import 'package:fbn/features/tenants/domain/entities/tenants.dart';
import 'package:fbn/features/tenants/domain/repositories/tenant_repository_interface.dart';
import 'package:fbn/features/tenants/data/services/tenant_service.dart';

class TenantRepository implements TenantRepositoryInterface {
  final TenantService _tenantService;

  TenantRepository(this._tenantService);

  @override
  Future<List<Tenant>> getTenants() async {
    return await _tenantService.getTenants();
  }

  @override
  Future<Tenant?> getTenantById(String id) async {
    return await _tenantService.getTenantById(id);
  }

  @override
  Future<Tenant?> updateTenant(String id) async {
    return await _tenantService.getTenantById(id);
  }

  @override
  Stream<List<Tenant>> watchTenants() {
    return _tenantService.watchTenants();
  }
}

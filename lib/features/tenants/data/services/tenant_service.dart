import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fbn/features/tenants/data/models/tenant_model.dart';
import 'package:fbn/core/constants/app_constants.dart';

class TenantService {
  final SupabaseClient _supabaseClient;

  TenantService(this._supabaseClient);

  Future<List<TenantModel>> getTenants() async {
    final response = await _supabaseClient
        .from(AppConstants.tenantsTable)
        .select('''
          *,
          rooms:room_id(type),
          payments:payments(created_at)
        ''')
        .order('name');

    return (response as List<dynamic>).map((json) {
      // Get the latest payment date
      final payments = json['payments'] as List<dynamic>?;
      DateTime? lastPaymentDate;
      if (payments != null && payments.isNotEmpty) {
        final dates = payments
            .map((p) => DateTime.parse(p['created_at'] as String))
            .toList();
        dates.sort((a, b) => b.compareTo(a));
        lastPaymentDate = dates.first;
      }

      return TenantModel.fromJson({
        ...json,
        'last_payment_date': lastPaymentDate?.toIso8601String(),
      });
    }).toList();
  }

  Future<TenantModel?> getTenantById(String id) async {
    final response = await _supabaseClient
        .from(AppConstants.tenantsTable)
        .select('''
          *,
          rooms:room_id(type),
          payments:payments(created_at)
        ''')
        .eq('id', id)
        .single();

    if (response == null) return null;

    // Get the latest payment date
    final payments = response['payments'] as List<dynamic>?;
    DateTime? lastPaymentDate;
    if (payments != null && payments.isNotEmpty) {
      final dates = payments
          .map((p) => DateTime.parse(p['created_at'] as String))
          .toList();
      dates.sort((a, b) => b.compareTo(a));
      lastPaymentDate = dates.first;
    }

    return TenantModel.fromJson({
      ...response,
      'last_payment_date': lastPaymentDate?.toIso8601String(),
    });
  }

  Stream<List<TenantModel>> watchTenants() {
    return _supabaseClient
        .from(AppConstants.tenantsTable)
        .stream(primaryKey: ['id'])
        .order('name')
        .map((data) => data.map((json) => TenantModel.fromJson(json)).toList());
  }
}

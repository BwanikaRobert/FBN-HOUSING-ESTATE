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
       
          tenant_rooms (
            start_date,
            end_date,
            rooms (room_number, type, monthly_rent)
          ),
          payments (
            amount,
            paid_on,
            created_at,
            received_by
   
          )
        ''')
        .order('name');

    final dataTenant = (response as List<dynamic>).map((json) {
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
      // Get amount per month

      final rooms = json['tenant_rooms'] as List<dynamic>?;

      double? totalAmount;
      List<String>? roomTypes;
      if (rooms != null && rooms.isNotEmpty) {
        roomTypes = rooms
            .map((elem) => elem['rooms']['room_number'].toString())
            .toList();
        totalAmount = rooms.fold(
          0,
          (prev, elem) => prev! + elem['rooms']['monthly_rent'],
        );
      }

      return TenantModel.fromJson({
        ...json,
        'last_payment_date': lastPaymentDate?.toIso8601String(),
        'payable_amount': totalAmount,
        'room_types': roomTypes,
      });
    }).toList();

    return dataTenant;
  }

  Future<void> updateTenant({
    required String tenantId,
    int? lastPaidMonth,
    double? balanceMonth,
  }) async {
    final updates = <String, dynamic>{};

    if (lastPaidMonth != null) updates['last_paid_month'] = lastPaidMonth;
    if (balanceMonth != null) updates['balance_month'] = balanceMonth.toInt();

    final response = await _supabaseClient
        .from(AppConstants.tenantsTable)
        .update(updates)
        .eq('id', tenantId) // condition
        .select();

    print("Updated tenant: $response");
  }

  Future<TenantModel?> getTenantById(String id) async {
    final response = await _supabaseClient
        .from(AppConstants.tenantsTable)
        .select('''
          *,
          tenant_rooms (
            start_date,
            end_date,
            rooms (room_number, type, monthly_rent)
          ),
          payments (
            amount,
            paid_on,
            created_at,
            received_by,
          
          )
        ''')
        .eq('id', id)
        .single();
    print(response);
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

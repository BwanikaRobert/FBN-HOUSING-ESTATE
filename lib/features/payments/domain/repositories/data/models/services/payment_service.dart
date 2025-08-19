import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fbn/core/constants/app_constants.dart';
import 'package:fbn/features/payments/domain/repositories/data/models/payment_model.dart';

class PaymentService {
  final SupabaseClient _supabaseClient;

  PaymentService(this._supabaseClient);

  Future<List<PaymentModel>> getPayments() async {
    final response = await _supabaseClient
        .from(AppConstants.paymentsTable)
        .select('''
          *,
          tenants:tenant_id(name)
        ''')
        .order('created_at', ascending: false);

    return (response as List<dynamic>)
        .map((json) => PaymentModel.fromJson(json))
        .toList();
  }

  Future<PaymentModel> createPayment({
    required String tenantId,
    required double amount,
    required String receivedBy,
  }) async {
    final response = await _supabaseClient
        .from(AppConstants.paymentsTable)
        .insert({
          'tenant_id': tenantId,
          'amount': amount,
          'received_by': receivedBy,
        })
        .select('''
          *,
          tenants:tenant_id(name)
        ''')
        .single();

    return PaymentModel.fromJson(response);
  }

  Stream<List<PaymentModel>> watchPayments() {
    return _supabaseClient
        .from(AppConstants.paymentsTable)
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false)
        .map(
          (data) => data.map((json) => PaymentModel.fromJson(json)).toList(),
        );
  }
}

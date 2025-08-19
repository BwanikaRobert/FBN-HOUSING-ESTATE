import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/supabase_provider.dart';
import 'package:fbn/features/payments/domain/entities/payment.dart';
import 'package:fbn/features/payments/domain/repositories/data/models/services/payment_service.dart';
import 'package:fbn/features/payments/domain/repositories/payment_repository.dart';

final paymentServiceProvider = Provider<PaymentService>((ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return PaymentService(supabaseClient);
});

final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  final paymentService = ref.watch(paymentServiceProvider);
  return PaymentRepository(paymentService);
});

final paymentsProvider = FutureProvider<List<Payment>>((ref) async {
  final repository = ref.watch(paymentRepositoryProvider);
  return await repository.getPayments();
});

final createPaymentProvider =
    FutureProvider.family<Payment, CreatePaymentParams>((ref, params) async {
      final repository = ref.watch(paymentRepositoryProvider);
      return await repository.createPayment(
        tenantId: params.tenantId,
        amount: params.amount,
        receivedBy: params.receivedBy,
      );
    });

class CreatePaymentParams {
  final String tenantId;
  final double amount;
  final String receivedBy;

  CreatePaymentParams({
    required this.tenantId,
    required this.amount,
    required this.receivedBy,
  });
}

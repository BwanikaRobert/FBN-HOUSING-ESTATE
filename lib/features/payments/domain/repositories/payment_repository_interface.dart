import '../entities/payment.dart';

abstract class PaymentRepositoryInterface {
  Future<List<Payment>> getPayments();
  Future<Payment> createPayment({
    required String tenantId,
    required double amount,
    required String receivedBy,
  });
  Stream<List<Payment>> watchPayments();
}

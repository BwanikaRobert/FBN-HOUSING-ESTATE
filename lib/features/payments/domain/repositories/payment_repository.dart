import 'package:fbn/features/payments/domain/entities/payment.dart';
import 'package:fbn/features/payments/domain/repositories/payment_repository_interface.dart';
import 'data/models/services/payment_service.dart';

class PaymentRepository implements PaymentRepositoryInterface {
  final PaymentService _paymentService;

  PaymentRepository(this._paymentService);

  @override
  Future<List<Payment>> getPayments() async {
    return await _paymentService.getPayments();
  }

  @override
  Future<Payment> createPayment({
    required String tenantId,
    required double amount,
    required String receivedBy,
  }) async {
    return await _paymentService.createPayment(
      tenantId: tenantId,
      amount: amount,
      receivedBy: receivedBy,
    );
  }

  @override
  Stream<List<Payment>> watchPayments() {
    return _paymentService.watchPayments();
  }
}

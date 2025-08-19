import 'package:fbn/features/payments/domain/entities/payment.dart';

class PaymentModel extends Payment {
  const PaymentModel({
    required super.id,
    required super.tenantId,
    required super.amount,
    required super.receivedBy,
    required super.createdAt,
    super.tenantName,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'] as String,
      tenantId: json['tenant_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      receivedBy: json['received_by'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      tenantName: json['tenants']?['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenant_id': tenantId,
      'amount': amount,
      'received_by': receivedBy,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

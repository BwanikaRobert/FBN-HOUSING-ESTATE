import 'package:fbn/features/tenants/domain/entities/tenants.dart';

class TenantModel extends Tenant {
  const TenantModel({
    required super.id,
    required super.name,
    super.tel,
    super.nationalId,
    super.lastPaidMonth,
    super.lastBalance,
    super.payableAmount,
    super.roomTypes,
    required super.createdAt,

    super.lastPaymentDate,
  });

  factory TenantModel.fromJson(Map<String, dynamic> json) {
    return TenantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      tel: json['tel'] as String?,
      nationalId: json['national_id'] as String?,
      lastPaidMonth: json['last_paid_month'] as int?,
      lastBalance: json['balance_month'] as int?,
      payableAmount: json['payable_amount'] as double?,
      roomTypes: json['room_types'] as List<String>?,

      createdAt: DateTime.parse(json['created_at'] as String),

      lastPaymentDate: json['last_payment_date'] != null
          ? DateTime.parse(json['last_payment_date'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tel': tel,
      'national_id': nationalId,

      'created_at': createdAt.toIso8601String(),
    };
  }
}

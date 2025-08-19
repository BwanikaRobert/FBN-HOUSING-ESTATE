import 'package:fbn/features/tenants/domain/entities/tenants.dart';

class TenantModel extends Tenant {
  const TenantModel({
    required super.id,
    required super.name,
    super.tel,
    super.nationalId,
    super.roomId,
    required super.monthlyRent,
    required super.createdAt,
    super.roomType,
    super.lastPaymentDate,
  });

  factory TenantModel.fromJson(Map<String, dynamic> json) {
    return TenantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      tel: json['tel'] as String?,
      nationalId: json['national_id'] as String?,
      roomId: json['room_id'] as String?,
      monthlyRent: (json['monthly_rent'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      roomType: json['rooms']?['type'] as String?,
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
      'room_id': roomId,
      'monthly_rent': monthlyRent,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

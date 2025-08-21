class Tenant {
  final String id;
  final String name;
  final String? tel;
  final String? nationalId;
  final int? lastPaidMonth;
  final int? lastBalance;
  final DateTime createdAt;
  final double? payableAmount;
  final List<String>? roomTypes;

  final DateTime? lastPaymentDate;

  const Tenant({
    required this.id,
    required this.name,
    this.tel,
    this.nationalId,
    this.lastPaidMonth,
    this.lastBalance,
    this.payableAmount,
    this.roomTypes,

    required this.createdAt,

    this.lastPaymentDate,
  });

  Tenant copyWith({
    String? id,
    String? name,
    String? tel,
    String? nationalId,
    String? roomId,
    double? monthlyRent,
    DateTime? createdAt,
    String? roomType,
    DateTime? lastPaymentDate,
  }) {
    return Tenant(
      id: id ?? this.id,
      name: name ?? this.name,
      tel: tel ?? this.tel,
      nationalId: nationalId ?? this.nationalId,

      createdAt: createdAt ?? this.createdAt,

      lastPaymentDate: lastPaymentDate ?? this.lastPaymentDate,
    );
  }
}

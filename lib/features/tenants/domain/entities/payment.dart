class Payment {
  final String id;
  final String tenantId;
  final double amount;
  final String receivedBy;
  final DateTime createdAt;
  final String? tenantName;

  const Payment({
    required this.id,
    required this.tenantId,
    required this.amount,
    required this.receivedBy,
    required this.createdAt,
    this.tenantName,
  });

  Payment copyWith({
    String? id,
    String? tenantId,
    double? amount,
    String? receivedBy,
    DateTime? createdAt,
    String? tenantName,
  }) {
    return Payment(
      id: id ?? this.id,
      tenantId: tenantId ?? this.tenantId,
      amount: amount ?? this.amount,
      receivedBy: receivedBy ?? this.receivedBy,
      createdAt: createdAt ?? this.createdAt,
      tenantName: tenantName ?? this.tenantName,
    );
  }
}

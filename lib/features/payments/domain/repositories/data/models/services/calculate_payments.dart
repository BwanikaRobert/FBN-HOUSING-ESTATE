class RentPaymentResult {
  final int startMonth;
  final int endMonth;
  final double balanceOnEndMonth;

  RentPaymentResult({
    required this.startMonth,
    required this.endMonth,
    required this.balanceOnEndMonth,
  });

  @override
  String toString() {
    return "Covers months $startMonth → $endMonth, balance on month $endMonth: $balanceOnEndMonth";
  }
}

RentPaymentResult calculateRentPayment({
  required double? monthlyRent,
  required int? lastPaidMonth,
  required double? amountPaid,
  required double? previousBalance, // outstanding balance from last paid month
}) {
  int startMonth = lastPaidMonth!;
  double remainingAmount = amountPaid!;

  // Step 1: Pay off the previous balance first
  if (previousBalance! > 0) {
    if (remainingAmount >= previousBalance!) {
      // Balance cleared
      remainingAmount -= previousBalance;
      startMonth = lastPaidMonth + 1;
    } else {
      // Couldn’t clear the balance → still in same month
      return RentPaymentResult(
        startMonth: lastPaidMonth,
        endMonth: lastPaidMonth,
        balanceOnEndMonth: previousBalance - remainingAmount,
      );
    }
  } else {
    startMonth = lastPaidMonth + 1;
  }

  // Step 2: Cover full months
  int fullMonths = (remainingAmount ~/ monthlyRent!);
  double leftover = remainingAmount % monthlyRent!;

  int endMonth = startMonth + fullMonths - 1;

  // Step 3: If leftover > 0 → extend to next month with balance
  if (leftover > 0) {
    endMonth += 1;
  }

  return RentPaymentResult(
    startMonth: startMonth,
    endMonth: endMonth,
    balanceOnEndMonth: leftover,
  );
}

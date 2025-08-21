String getMonthName(int monthNumber) {
  const months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  if (monthNumber < 1 || monthNumber > 12) {
    throw ArgumentError("Month number must be between 1 and 12.");
  }

  return months[monthNumber - 1];
}

double calculateOutstandingBalance({
  required double monthlyRent,
  required int lastPaidMonth,
  required double previousBalance,
}) {
  DateTime now = DateTime.now();

  // If today's date is still within the current month,
  // we only count up to the previous month
  int currentMonth = now.month;
  int monthsDue;
  print('dates');

  if (currentMonth <= lastPaidMonth) {
    return previousBalance; // no new months fully completed
  }
  if (previousBalance > 0) {
    lastPaidMonth = lastPaidMonth + 1;
  }
  monthsDue = currentMonth - lastPaidMonth;

  return (monthsDue * monthlyRent) + previousBalance;
}

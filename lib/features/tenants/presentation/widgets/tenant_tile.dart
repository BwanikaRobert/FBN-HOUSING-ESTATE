import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fbn/features/tenants/domain/entities/tenants.dart';

class TenantTile extends StatelessWidget {
  final Tenant tenant;
  final VoidCallback onTap;

  const TenantTile({super.key, required this.tenant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    print(tenant);
    final lastPaymentText = tenant.lastPaymentDate != null
        ? DateFormat('MMM yyyy').format(tenant.lastPaymentDate!)
        : 'No payments';

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            tenant.name.isNotEmpty ? tenant.name[0].toUpperCase() : 'T',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          tenant.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rent: \$${tenant.monthlyRent.toStringAsFixed(2)}'),
            Text('Last paid: $lastPaymentText'),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
        isThreeLine: true,
      ),
    );
  }
}

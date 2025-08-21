import 'package:fbn/utils/helper.dart';
import 'package:flutter/material.dart';

import 'package:fbn/features/tenants/domain/entities/tenants.dart';

class TenantTile extends StatelessWidget {
  final Tenant tenant;
  final VoidCallback onTap;

  const TenantTile({super.key, required this.tenant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    print(tenant.lastPaymentDate);

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            tenant.name.isNotEmpty ? tenant.name[0].toUpperCase() : 'T',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          tenant.name.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Last paid: ${getMonthName(tenant.lastPaidMonth!)}')],
        ),

        onTap: onTap,
        isThreeLine: true,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fbn/features/tenants/domain/entities/tenants.dart';

class TenantDetailsPage extends StatelessWidget {
  final Tenant tenant;

  const TenantDetailsPage({super.key, required this.tenant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tenant.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 40,
                        child: Text(
                          tenant.name.isNotEmpty
                              ? tenant.name[0].toUpperCase()
                              : 'T',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildDetailRow('Full Name', tenant.name),
                    const SizedBox(height: 12),
                    _buildDetailRow('Telephone', tenant.tel ?? 'Not provided'),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      'National ID',
                      tenant.nationalId ?? 'Not provided',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      'Room Type',
                      tenant.roomType ?? 'Not assigned',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      'Monthly Rent',
                      '\$${tenant.monthlyRent.toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      'Last Payment',
                      tenant.lastPaymentDate != null
                          ? DateFormat(
                              'MMM dd, yyyy',
                            ).format(tenant.lastPaymentDate!)
                          : 'No payments made',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            '$label:',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

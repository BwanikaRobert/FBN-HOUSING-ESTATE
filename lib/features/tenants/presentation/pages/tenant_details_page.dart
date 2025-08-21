import 'package:fbn/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fbn/features/tenants/domain/entities/tenants.dart';
import 'package:url_launcher/url_launcher.dart';

class TenantDetailsPage extends StatelessWidget {
  final Tenant tenant;

  const TenantDetailsPage({super.key, required this.tenant});
  Future<void> _launchPhoneURL(String phoneNumber) async {
    Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tenant.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _launchPhoneURL('+2567778888');
        },

        child: const Icon(Icons.phone),
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
                    _buildDetailRow('Rooms', '', rooms: tenant.roomTypes),
                    const SizedBox(height: 12),
                    _buildDetailRow('Monthly Rent', '${tenant.payableAmount}'),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      'Outstanding Balance',
                      '${calculateOutstandingBalance(monthlyRent: tenant.payableAmount!, lastPaidMonth: tenant.lastPaidMonth!, previousBalance: tenant.lastBalance!.toDouble())}',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      'Last Paid Month',
                      getMonthName(tenant.lastPaidMonth!),
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

  Widget _buildDetailRow(String label, String value, {List<dynamic>? rooms}) {
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
          child: rooms != null
              ? Row(children: rooms.map((room) => Text('$room, ')).toList())
              : Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
        ),
      ],
    );
  }
}

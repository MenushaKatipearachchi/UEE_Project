import 'package:flutter/material.dart';
import 'test_message.dart';
import 'escrow_process.dart';
import 'pending_exchanges_widget.dart';

class ExchangePage extends StatefulWidget {
  final String opEmail;
  final String loggedInUserEmail;

  const ExchangePage(
      {Key? key, required this.opEmail, required this.loggedInUserEmail})
      : super(key: key);

  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  void _navigateToMessageWidget(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Message Seller'),
          content: MessageWidget(recipientEmail: widget.opEmail),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToExchangeWidget(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Exchange Items'),
          content: EscrowWidget(
            recipientEmail: widget.opEmail,
            loggedInUserEmail: widget.loggedInUserEmail,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sample Dress',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'This is a beautiful sample dress for exchange.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            if (widget.opEmail != widget.loggedInUserEmail)
              ElevatedButton(
                onPressed: () {
                  _navigateToMessageWidget(context);
                },
                child: const Text('Message Seller'),
              ),
            if (widget.opEmail != widget.loggedInUserEmail)
              ElevatedButton(
                onPressed: () {
                  _navigateToExchangeWidget(context);
                },
                child: const Text('Exchange Items'),
              ),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            Text(
              'Pending Exchanges:',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Container(
              // Wrap the Column in a Container and provide a height
              height: MediaQuery.of(context).size.height * 0.5, // for example
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PendingExchangesWidget(
                        loggedInUserEmail: widget.loggedInUserEmail),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class RecycledProductDetailEditPage extends StatelessWidget {
  final Map<String, dynamic> productData;
  final TextEditingController nameController;
  final TextEditingController quantityController;
  final TextEditingController assignedStatusController;
  final TextEditingController assignedCenterMYController;

  final String documentId;

  RecycledProductDetailEditPage({
    required this.productData,
    required this.nameController,
    required this.quantityController,
    required this.assignedStatusController,
    required this.assignedCenterMYController,
    required this.documentId,
    required TextEditingController descriptionController,
    required TextEditingController assignedCenterrController,
    required imageUrl,
    required TextEditingController assignedCenterController,
  });

  Future<void> _updateProductDetails() async {
    try {
      await FirebaseFirestore.instance
          .collection('recycle')
          .doc(documentId)
          .update({
        'name': nameController.text,
        'quantity': int.parse(quantityController.text),
        'assigned_status': assignedStatusController.text,
        'assigned_center': assignedCenterMYController.text,
      });
      print('Product updated successfully.');
    } catch (e) {
      print('Failed to update product: $e');
    }
  }

  Future<void> _sendEmail() async {
    final recipientEmail = productData['assigned_center_email'];
    final subject = 'Regarding Recycle Product: ${productData['name']}';
    final body =
        "Hello,\n\n I would like to discuss the recycle product ${productData['name']}.\n";

    final emailUrl = Uri(
      scheme: 'mailto',
      path: recipientEmail,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    try {
      await launch(emailUrl.toString());
    } catch (e) {
      print('Error launching email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final String imageUrl = productData['imageUrl'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                    padding: EdgeInsets.all(16),
                  ),
                  ListTile(
                    title: Text('Name: ${productData['name']}'),
                  ),
                  ListTile(
                    title: Text('Quantity: ${productData['quantity']}'),
                  ),
                  ListTile(
                    title: Text(
                        'Assigned Status: ${productData['assigned_status']}'),
                  ),
                  ListTile(
                    title: Text(
                        'Assigned Center: ${productData['assigned_center']}'),
                  ),
                  ListTile(
                    title: ElevatedButton(
                      onPressed: _sendEmail,
                      child: Text('Send Email'),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Assign Recycle Center'),
                  ),
                  ListTile(
                    title: TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      controller: quantityController,
                      decoration: InputDecoration(labelText: 'Quantity'),
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      controller: assignedStatusController,
                      decoration: InputDecoration(labelText: 'Assigned Status'),
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      controller: assignedCenterMYController,
                      decoration: InputDecoration(labelText: 'Assigned Center'),
                    ),
                  ),
                  ListTile(
                    title: ElevatedButton(
                      onPressed: () {
                        _updateProductDetails();
                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ),
                  ListTile(
                    title: ElevatedButton(
                      onPressed: () {},
                      child: Text('Find Recycle Center'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

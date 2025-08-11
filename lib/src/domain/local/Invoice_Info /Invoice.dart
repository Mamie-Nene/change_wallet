import 'Supplier.dart';

import 'Customer.dart';

class Invoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<InvoiceItem> items;

  const Invoice({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;

  final String moyenPaiement;


  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.moyenPaiement,
  });
}

class InvoiceItem {
  final String? service;
  final String refFacture;
  final DateTime date;
  final double montant;

  const InvoiceItem({
    required this.service,
    required this.date,
    required this.refFacture,
    required this.montant,
  });
}
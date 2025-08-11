import 'Supplier.dart';

import 'Customer.dart';

class InvoiceBis {
  final InvoiceInfoBis info;
  final Supplier supplier;
  final Customer customer;
  final List<InvoiceItemBis> items;

  const InvoiceBis({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfoBis {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfoBis({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItemBis {
  final String description;
  final DateTime date;
  final int quantity;
  final double vat;
  final double unitPrice;

  const InvoiceItemBis({
    required this.description,
    required this.date,
    required this.quantity,
    required this.vat,
    required this.unitPrice,
  });
}
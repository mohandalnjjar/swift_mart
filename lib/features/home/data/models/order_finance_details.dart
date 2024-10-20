class OrderFinanceDetails {
  final double supTotalPrice;
  final double totalShippingCoast;

  OrderFinanceDetails({
    this.supTotalPrice = 0.0,
    this.totalShippingCoast = 0.0,
  });

  double get totalPrice => supTotalPrice + totalShippingCoast;
}

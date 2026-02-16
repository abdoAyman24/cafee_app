import 'package:caffee/Feature/Cart/domain/entity/cart_entity.dart';
import 'package:caffee/Feature/payment/data/model/paypal_model/amount_model/amount_model.dart';
import 'package:caffee/Feature/payment/data/model/paypal_model/amount_model/details.dart';
import 'package:caffee/Feature/payment/data/model/paypal_model/item_list_model/item_list_model.dart';
import 'package:caffee/Feature/payment/data/model/paypal_model/item_list_model/order_item_model.dart';

({AmountModel amount, OrderItemListModel itemsList}) getTransactionData({
  required CartEntity cartEntity,
}) {
  AmountModel amount = AmountModel(
    total: cartEntity.calculateTotalPrice().toString(),
    currency: 'USD',
    details: Details(
      subtotal: cartEntity.calculateTotalPrice().toString(),
      shipping: '0',
      shippingDiscount: 0,
    ),
  );
  List<OrderItemModel> items = [
    // OrderItemModel(name: 'Apple', quantity: 4, currency: 'USD', price: '10'),
  ];
  for (var element in cartEntity.cartItems) {
    items.add(
      OrderItemModel(name: element.productEntity.name, quantity: element.quantity.toInt(), currency: 'USD', price: element.calculatePrice().toString()),
    );
  }

  OrderItemListModel itemListModel = OrderItemListModel(items: items);

  return (amount: amount, itemsList: itemListModel);
}

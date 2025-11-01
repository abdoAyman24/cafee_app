import 'package:bloc/bloc.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntity cartItemEntity) {
    if(cartItemEntity.quantity==0){
      
    }
    emit(CartItemUpdate(cartItemEntity: cartItemEntity));
  }

  
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_size_state.dart';

class ProductSizeCubit extends Cubit<ProductSizeState> {
  ProductSizeCubit() : super(ProductSizeInitial());

  ProductSize productSize = ProductSize.smalle;
  void updateproductSize(ProductSize productSize) {
    this.productSize = productSize;
  }

  String getSize() {
    if (productSize == ProductSize.smalle) {
      return 'priceS';
    } else if (productSize == ProductSize.medium) {
      return 'priceM';
    } else {
      return 'priceL';
    }
  }

  void generateSize() {
    emit(Generate());

    if (productSize == ProductSize.smalle) {
      emit(Smalle());
    } else if (productSize == ProductSize.medium) {
      emit(Medium());
    } else {
      emit(Large());
    }
  }
}

enum ProductSize { smalle, large, medium }

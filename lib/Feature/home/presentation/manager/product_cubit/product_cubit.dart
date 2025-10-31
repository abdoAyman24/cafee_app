import 'package:bloc/bloc.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:caffee/Feature/home/domain/product_repo/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());
  final ProductRepo productRepo;

  
  

  Future<void> getProducts() async {
    emit(ProductLoading());
    var result = await productRepo.getProduct();
    result.fold(
      (l) {
        emit(ProductFailure(errorMessage: l.message));
      },
      (products) {
        emit(ProductSuccess(products: products));
      },
    );
  }
}



import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:caffee/Core/repo/favorite_repo/favorite_repo.dart';
import 'package:caffee/Feature/home/data/Model/product_model.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());
  final FavoriteRepo favoriteRepo;
  StreamSubscription? streamSubscription;

  List<ProductEntity> products = [];
  Future<void> getFavoriteData() async {
    emit(FavoriteLoad());
    streamSubscription = favoriteRepo.getFavoritesData().listen((result) {
      result.fold(
        (l) {
          emit(FavoriteFailure(errorMessage: l.message));
        },
        (r) {
          // product = List<ProductEntity>.from(r);
          products = r;
          emit(FavoriteSuccess(products: r));
        },
      );
    });
  }

  @override
  Future<void> close() {
    streamSubscription!.cancel();
    return super.close();
  }

  void addToFavorite(ProductEntity productEntity) async {
    emit(FavoriteLoad());
    var result = await favoriteRepo.addFavorite(
      data: ProductModel.fromEntity(productEntity).toJson(),
      productId: productEntity.productId,
    );
    result.fold(
      (l) {
        log('product Add To Favorite');
        emit(FavoriteFailure(errorMessage: l.message));
      },
      (r) {
        emit(FavoriteAdded());
      },
    );
  }

  void deleteFromFavorite(ProductEntity product) async {
    var result = await favoriteRepo.deleteFavorite(
      productId: product.productId,
    );
    result.fold(
      (l) {
        emit(FavoriteFailure(errorMessage: l.message));
      },
      (r) {
        emit(FavoriteDelete());
      },
    );
  }

  bool isFavorite(ProductEntity product) {
    for (var i = 0; i < products.length; i++) {
      if (product == products[i]) {
        return true;
      }
    }
      return false;
  }
}

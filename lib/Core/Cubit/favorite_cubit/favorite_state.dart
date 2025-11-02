part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoad extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<ProductEntity> products;

  FavoriteSuccess({required this.products});
}

final class FavoriteFailure extends FavoriteState {
  final String errorMessage;

  FavoriteFailure({required this.errorMessage});
}

final class FavoriteAdded extends FavoriteState {}

final class FavoriteDelete extends FavoriteState {}

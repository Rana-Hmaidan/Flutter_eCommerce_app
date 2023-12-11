part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {
  const FavoritesState();
}

final class FavoritesInitial extends FavoritesState{}

final class FavoritesLoading extends FavoritesState{}

final class FavoritesLoaded extends FavoritesState{

  final List<ProductItemModel> favoritesItems;

  const FavoritesLoaded({
    required this.favoritesItems,
  });
  
}

final class FavoritesError extends FavoritesState{
  final String message;

  const FavoritesError({
    required this.message
  });
}
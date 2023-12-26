part of 'favorites_cubit.dart';

class FavoritesState {}

class FavoriteLoadingState extends FavoritesState{}

class FavoriteLoadedState extends FavoritesState{
  final List<ProductItemModel> products;

  FavoriteLoadedState(this.products);
}

// class FavoritesState extends Equatable{

//   Map<String , bool> favoriteProducts;
//   Map<String , bool> loadingProducts;

//   factory FavoritesState.initial() => FavoritesState(
//     favoriteProducts: {}, 
//     loadingProducts: {},
//   );

//   FavoritesState({
//     required this.favoriteProducts,
//     required this.loadingProducts,
//   });


//   FavoritesState copyWith({
//     Map<String , bool>? products,
//     Map<String , bool>? isLoading,
//     }) => FavoritesState(
//         favoriteProducts: products ?? favoriteProducts,
//         loadingProducts: isLoading ?? loadingProducts,
//     );

//   @override
//   List<Object?> get props => [favoriteProducts, loadingProducts];

// }

// @immutable
// sealed class FavoritesState {
//   const FavoritesState();
// }

// final class FavoritesInitial extends FavoritesState{}

// final class FavoritesLoading extends FavoritesState{}

// final class FavoritesLoaded extends FavoritesState{

//   final List<ProductItemModel> favoritesItems;

//   const FavoritesLoaded({
//     required this.favoritesItems,
//   });
  
// }

// final class FavoritesError extends FavoritesState{
//   final String message;

//   const FavoritesError({
//     required this.message
//   });
// }
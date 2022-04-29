import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/error/exceptions.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/features/data/datasources/restaurant_local_datasource.dart';
import 'package:restaurant_app/features/data/datasources/restaurant_remote_datasource.dart';
import 'package:restaurant_app/features/data/models/restaurant_table.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

@LazySingleton(as: RestaurantRepository)
class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;
  final RestaurantLocalDataSource localDataSource;

  RestaurantRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, RestaurantDetail>> getRestaurantDetail(
      String id) async {
    try {
      final result = await remoteDataSource.getRestaurantDetail(id);
      return Right(result.restaurant.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure(MyStrings.failedConnection));
    }
  }

  @override
  Future<Either<Failure, List<Restaurant>>> getRestaurantSearch(
      String search) async {
    try {
      final result = await remoteDataSource.getRestaurantSearch(search);
      return Right(result.restaurants.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure(MyStrings.failedConnection));
    }
  }

  @override
  Future<Either<Failure, List<Restaurant>>> getRestaurants() async {
    try {
      final result = await remoteDataSource.getRestaurants();
      return Right(result.restaurants.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure(MyStrings.failedConnection));
    }
  }

  @override
  Future<Either<Failure, List<Restaurant>>> getFavoriteRestaurants() async {
    try {
      final result = await localDataSource.getFavoriteRestaurants();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure(MyStrings.failedConnection));
    }
  }

  @override
  Future<bool> isAddedToFavorite(String id) async {
    final result = await localDataSource.getRestaurantById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, String>> removeFavorite(String id) async {
    try {
      final result = await localDataSource.removeRestaurant(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveFavorite(Restaurant restaurant) async {
    try {
      final result = await localDataSource
          .saveRestaurant(RestaurantTable.fromEntity(restaurant));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }
}

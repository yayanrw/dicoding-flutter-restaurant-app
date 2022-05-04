// ignore_for_file: always_specify_types

import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/error/exceptions.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/features/data/datasources/restaurant_local_datasource.dart';
import 'package:restaurant_app/features/data/datasources/restaurant_remote_datasource.dart';
import 'package:restaurant_app/features/data/models/restaurant_detail_response.dart';
import 'package:restaurant_app/features/data/models/restaurant_list_response.dart';
import 'package:restaurant_app/features/data/models/restaurant_model.dart';
import 'package:restaurant_app/features/data/models/restaurant_search_response.dart';
import 'package:restaurant_app/features/data/models/restaurant_table.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

@LazySingleton(as: RestaurantRepository)
class RestaurantRepositoryImpl implements RestaurantRepository {
  RestaurantRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final RestaurantLocalDataSource localDataSource;
  final RestaurantRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Restaurant>>> getFavoriteRestaurants() async {
    try {
      final List<RestaurantTable> result =
          await localDataSource.getFavoriteRestaurants();

      return Right(result.map((RestaurantTable e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed connection'));
    }
  }

  @override
  Future<Either<Failure, Restaurant>> getRandomRestaurant() async {
    try {
      final RestaurantModel result =
          await remoteDataSource.getRandomRestaurant();

      return Right(result.toEntity());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, RestaurantDetail>> getRestaurantDetail(
    String id,
  ) async {
    try {
      final RestaurantDetailResponse result =
          await remoteDataSource.getRestaurantDetail(id);

      return Right(result.restaurant!.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed connection'));
    }
  }

  @override
  Future<Either<Failure, List<Restaurant>>> getRestaurantSearch(
    String search,
  ) async {
    try {
      final RestaurantSearchResponse result =
          await remoteDataSource.getRestaurantSearch(search);
      return Right(
        result.restaurants!.map((RestaurantModel e) => e.toEntity()).toList(),
      );
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed connection'));
    }
  }

  @override
  Future<Either<Failure, List<Restaurant>>> getRestaurants() async {
    try {
      final RestaurantListResponse result =
          await remoteDataSource.getRestaurants();

      return Right(
        result.restaurants!.map((RestaurantModel e) => e.toEntity()).toList(),
      );
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed connection'));
    }
  }

  @override
  Future<bool> isAddedToFavorite(String id) async {
    final RestaurantTable? result = await localDataSource.getRestaurantById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, String>> removeFavorite(String id) async {
    try {
      final String result = await localDataSource.removeRestaurant(id);

      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveFavorite(Restaurant restaurant) async {
    try {
      final String result = await localDataSource
          .saveRestaurant(RestaurantTable.fromEntity(restaurant));

      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }
}

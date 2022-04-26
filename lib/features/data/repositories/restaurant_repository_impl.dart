import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/error/exceptions.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/features/data/datasources/restaurant_remote_datasource.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

@lazySingleton
class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;

  RestaurantRepositoryImpl({required this.remoteDataSource});

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
}

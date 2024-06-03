import 'package:fpdart/fpdart.dart';
import 'package:last/core/error/faliure.dart';

abstract interface class UseCase<SuccessType, Params>{
  Future<Either<Failure,SuccessType>> call(Params params);

}
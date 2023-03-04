import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/core/usecase/base_usecase.dart';

import '../entities/tv_details.dart';
import '../repositories/base_tv_repository.dart';

class GetTVDetailsUseCase extends BaseUseCase<TVDetail, TVDetailParameters> {
  final BaseTVRepository baseTVRepository;

  GetTVDetailsUseCase(this.baseTVRepository);

  @override
  Future<Either<Failure, TVDetail>> call(TVDetailParameters parameters) async {
    return await baseTVRepository.getTVDetails(parameters);
  }
}

class TVDetailParameters extends Equatable {
  final int tvId;

  const TVDetailParameters({required this.tvId});

  @override
  List<Object?> get props => [tvId];
}

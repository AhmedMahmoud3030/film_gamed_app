import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/core/usecase/base_usecase.dart';
import '../../../../core/error/failure.dart';
import '../entities/tv.dart';
import '../repositories/base_tv_repository.dart';

class GetTopRatedTVsUseCase extends BaseUseCase<List<TV>, NoParameters> {
  final BaseTVRepository baseTVRepository;

  GetTopRatedTVsUseCase(this.baseTVRepository);

  @override
  Future<Either<Failure, List<TV>>> call(NoParameters parameters) async {
    return await baseTVRepository.getTopRatedTVs();
  }
}

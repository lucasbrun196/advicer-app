import 'package:advicer_app/app/modules/home/domain/entities/user_data.dart';
import 'package:advicer_app/app/modules/home/domain/repositories/home_repository.dart';
import 'package:advicer_app/app/modules/home/domain/services/home_service.dart';

class HomeServiceImp implements HomeService {

  final HomeRepository homeRepository;
  HomeServiceImp({
    required this.homeRepository,
  });

  @override
  Future<UserData> getUserData(String userUid) async{
    return homeRepository.getUserData(userUid);
  }

  @override
  Future<String> getCurrentUserUid() async {
    return homeRepository.getCurrentUserUid();
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:futursityclone/features/home/repository/homeRepository.dart';

final HomeRepositoryController = Provider((ref) => HomeController(homeRepository: ref.watch(HomeRepositoryProvider)));

class HomeController{
  final HomeRepository _homeRepository;

  HomeController({required HomeRepository homeRepository}):
      _homeRepository=homeRepository;

  getData(){
 return _homeRepository.getData();
}

getCategory(){
    return _homeRepository.getCategory();
}
getTopCourse(){
    return _homeRepository.getTopCourse();
}
}
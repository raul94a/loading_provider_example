import 'package:loading_provider_example/data/models/dog_model.dart';
import 'package:loading_provider_example/data/services/dog_services.dart';

class DogRepository{

  final DogServices dogService = DogServices();

  Future<Dog> getDog()async{
    Map<String,dynamic> doggo = await dogService.getDog();
    print('DOGGO: $doggo');
    ;
    return Dog.fromMap(doggo);
  }
}
import 'package:flutter/cupertino.dart';
import 'package:loading_provider_example/data/models/dog_model.dart';
import 'package:loading_provider_example/data/repositories/dog_repository.dart';

class DogProvider with ChangeNotifier{

  final DogRepository repository = DogRepository();
  bool loading = false;
  Dog? doggy = null;



  Future<void> getDog()async{
    loading = true;
    notifyListeners();
    //delayed para que se haga visible el retardo... y el cambio de estado
    await Future.delayed(const Duration(seconds: 2));
    Dog? dog;
    try{
      dog = await repository.getDog();
   
    }catch(error){
      print(error.toString());
    }finally{
      loading = false;
     
    }

    doggy = dog;
    notifyListeners();
  }



}
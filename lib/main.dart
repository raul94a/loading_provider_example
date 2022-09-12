import 'package:flutter/material.dart';
import 'package:loading_provider_example/providers/dog_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DogProvider(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
              appBar: AppBar(
                title: Text('Loading con provider'),
              ),
              body: const LoadingExample())),
    );
  }
}

class LoadingExample extends StatelessWidget {
  const LoadingExample({super.key});

  @override
  Widget build(BuildContext context) {
    //con watch observamos el cambio directamente... cuidado, que no se puede llamar dentro de un onPress de un boton o callback similar.

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<DogProvider>(
            builder: (context, value, _) => Visibility(
                visible: value.loading,
                child: const CircularProgressIndicator()),
          ),
          Consumer<DogProvider>(
              builder: (context, value, _) =>
                  Text(value.loading ? " LOADING " : "NOT LOADING")),
          Consumer<DogProvider>(
            builder: (context, value, _) => Visibility(
                visible: value.doggy != null,
                child: Image(
                  image: NetworkImage(value.doggy == null ? "" : value.doggy!.message),
                )),
          ),
          ElevatedButton(
              onPressed: context.read<DogProvider>().getDog,
              child: Text('cargar nuevo perro'))
        ],
      ),
    );
    /*if(provider.loading){
      return Center(child: Column(children: const [
        CircularProgressIndicator(color: Colors.redAccent,),
        Text('Loading...')
      ],),);
    }
    return Column(children: [
      Image(image: NetworkImage(provider.doggy == null ?  "" : provider.doggy!.message)),
      ElevatedButton(onPressed: ()async{
        provider.getDog();
      }, child: Text('cargar nuevo perro'))
    ],);*/
  }
}


enum Base{
  dogBaseUrl
}
//aqui pondriamos las BASE_URL de cada endpoint. Imagina que utilizaramos variso endpoints
//Por ejemplo, uno de nuestor server, otro de nuestro firebase, otro de googleAuth, otro de amazon web services...
//Aqui se registrarían las BASE_URL de cada endpoint, por ejemplo  https://chechu.com/api/v1/

//Imagina que dentro de tu api tuvieras muchos endpoint... uno de ellos puede ser productos...
//entonces quedaría así https://chechu.com/api/v1/productos  <--- pero esto no lo manejas aquí
//lo manejas en una clase aparte o en el propio servicio de tu endpoint (que contendrá todas las terminaciones del endpoint,
//
// ya sea /productos, /perros, /monedas, etc)

//Justo en este ejemplo pongo el endpoint completo en este mismo archivo porque solo voy a utilizar un endpoint de la api
class BaseUrl{
  static Map<Base, String> endpoints = {
   Base.dogBaseUrl: "https://dog.ceo/api/breeds/image/random",
    //... resto de base_url de las diferentes api
  };

  static String getBaseUrl(Base baseUrl){
    return endpoints[baseUrl]!;
  }
}
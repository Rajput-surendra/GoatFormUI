
import 'apiBasehelper.dart';
ApiBaseHelper apiBaseHelper = ApiBaseHelper();
class ApiService {
 static const String baseUrl = "https://developmentalphawizz.com/goat_farm/app/v1/api/";
  static const String imageUrl = "https://developmentalphawizz.com/goat_farm/";
  static const String userTypeApi = baseUrl+'user_type';
  static const String register = baseUrl+'register';
  static const String login = baseUrl+'login';
  static const String userPermission = baseUrl+'users_permission';
  static const String animalCategory = baseUrl+'animal_category';
  static const String animalCount = baseUrl+'animal_counts';
  static const String addPurchase = baseUrl+'add_purchase';
  static const String purchaseList = baseUrl+'purchase_list';
  static const String addBreed = baseUrl+'add_breed';
  static const String breedList = baseUrl+'breed_list';
  static const String addAnimal = baseUrl+'add_animal';
  static const String animalList = baseUrl+'animal_list';
}




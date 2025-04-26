
import 'package:ecommerece_app_api/products/controller/service_controller.dart';
import 'package:ecommerece_app_api/products/model/categoryModel.dart';
import 'package:ecommerece_app_api/products/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final _controller = Get.put(ServiceController());
  late Future<ProductModel> productFuture;
  late Future<ProductModel> banner;
  late Future<List<CategoryModel>> categoryList;
  List<Product> searchResults = [];

  String selectedCategory = 'all';
  @override
  void onInit() {
    
    categoryList = _controller.getCategory();
    banner = _controller.getProducts();
    getAllProductData();
    fetchcategoryData(selectedCategory);
    super.onInit();
  }

  

  Future<void> getAllProductData()async{
    productFuture = _controller.getProducts();
    update(); // notify listeners
  }

  void fetchcategoryData(String category) {
    selectedCategory = category.toLowerCase();
    if (selectedCategory == 'all') {
      productFuture = _controller.getProducts();
    } else {
      productFuture = _controller.getCategoryProduct(selectedCategory);
    }
    update(); // notify listeners
  }

}

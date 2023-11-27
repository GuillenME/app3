import 'package:aplicacion/src/models/producto_modelo.dart';
import 'package:aplicacion/src/service/producto_service.dart';
import 'package:get/get.dart';

class ControllerList extends GetxController {
  var listaProducto = <ProductoModelo>[].obs;
  ProductsService service = ProductsService();

  @override
  void onInit() {
    super.onInit();
    var list = service.loadProducts();
    list.then((value) => listaProducto.value = value);
  }

  @override
  void refresh() {
    var list = service.loadProducts();
    list.then((value) => listaProducto.value = value);
  }

  void actualizar(ProductoModelo producto) async {
    await service.updateProduct(producto);
    int index =
        // ignore: invalid_use_of_protected_member
        listaProducto.value.indexWhere((element) => element.id == producto.id);
    listaProducto[index] = producto;
  }

  void delete(ProductoModelo value) {
    service.deleteProduct(value);
    int index =
        // ignore: invalid_use_of_protected_member
        listaProducto.value.indexWhere((element) => element.id == value.id);
    listaProducto.removeAt(index);
  }

  Future<String?> agregar(ProductoModelo producto) async {
    String? id = await service.createProduct(producto);
    producto.id = id;
    listaProducto.add(producto);
    return id;
  }
}

import 'package:aplicacion/src/controller/controller_list.dart';
import 'package:aplicacion/src/models/producto_modelo.dart';
import 'package:aplicacion/src/service/producto_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerProducto extends GetxController {
  String? _id = '';
  var productName = ''.obs;
  var productPrice = ''.obs;
  var productoAvailable = true.obs;
  bool fName = false;
  bool fPrice = false;
  RxnString errorName = RxnString(null);
  RxnString errorPrice = RxnString(null);

  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  ProductsService? service;
  ControllerList ctrlst = Get.find();
  var ctrName = TextEditingController().obs;
  var crtPrice = TextEditingController().obs;

  void setAttributes(String id, String nombre, double precio, bool disponible) {
    _id = id;
    ctrName.value.text = nombre;
    crtPrice.value.text = precio.toString();
    productName.value = nombre;
    productPrice.value = precio.toString();
    productoAvailable.value = disponible;
  }

  @override
  void onInit() {
    super.onInit();
    service = ProductsService();

    debounce<String>(productName, validarName,
        time: const Duration(microseconds: 500));
    debounce<String>(productPrice, validarPrice,
        time: const Duration(microseconds: 500));
  }

  void validarName(String val) {
    errorName.value = null;
    submitFunc.value = null;
    if (val.length > 3) {
      errorName.value = null;
      submitFunc.value = submitFunction();
      fName = true;
    } else {
      errorName.value = 'El nombre debe ser mayor a 3 dígitos';
      fName = false;
    }
  }

  void validarPrice(String val) {
    errorPrice.value = null;
    submitFunc.value = null;
    if (double.tryParse(val) is double && double.parse(val) > 10) {
      errorPrice.value = null;
      submitFunc.value = submitFunction();
      fPrice = true;
    } else {
      errorPrice.value = 'debe de ser mayor a 10';
      fPrice = false;
    }
  }

  void namedChanged(String val) {
    productName.value = val;
  }

  void princeChanged(String val) {
    productPrice.value = val;
  }

  void availableChanged(bool val) {
    productoAvailable.value = val;
  }

  Future<bool> Function() submitFunction() {
    return () async {
      if (!fName || !fPrice) {
        submitFunc.value = null;
        validarName(productName.value);
        validarPrice(productPrice.value);
        return true;
      } else {
        String? mensaje = 'Se agregó un nuevo producto';
        if (_id == '') {
          ProductoModelo producto = ProductoModelo(
              nombre: productName.value,
              precio: double.tryParse(productPrice.value) ?? 0,
              disponible: productoAvailable.value);
          _id = await ctrlst.agregar(producto);
        } else {
          ProductoModelo producto = ProductoModelo(
              id: _id,
              nombre: productName.value,
              precio: double.tryParse(productPrice.value) ?? 0,
              disponible: productoAvailable.value);
          ctrlst.actualizar(producto);
          mensaje = 'Se actualizó el producto';
          Get.offNamed('/listaProducto');
        }
        //service?.createProduct(producto);
        if (_id!.isNotEmpty) {
          ctrName.value.text = '';
          crtPrice.value.text = '';
          productoAvailable.value = true;
          Get.snackbar('Producto', mensaje);
        }
        return true;
      }
    };
  }
}

import 'package:eshemachoch_web_application/constants/api.dart';
import 'package:eshemachoch_web_application/models/product.dart';
import 'package:eshemachoch_web_application/viewmodels/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, this.product}) : super(key: key);
  final Product? product;
  static const route = '/product';
  @override
  ProductDetailsState createState() => ProductDetailsState();
}

class ProductDetailsState extends State<ProductDetails> {
  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  Product? product;
  XFile? pickedImage;
  @override
  Widget build(BuildContext context) {
    var edit = widget.product != null;
    handleAdding() {
      if (form.validate()) {
        product = Product.empty();
        form.save();
        product = product?.copyWith(date: DateTime.now().millisecondsSinceEpoch);
        context.read<ProductModel>().addProduct(product!, pickedImage!);
        Navigator.pop(context);
      }
    }

    handleUpdating() {
      if (form.validate()) {
        product = Product.empty();
        form.save();
        if (widget.product! != product!) {
          product = product?.copyWith(id: widget.product!.id!);
          product = product?.copyWith(image: widget.product!.image);
          product = product?.copyWith(date: DateTime.now().millisecondsSinceEpoch);
          context.read<ProductModel>().updateProduct(product!);
        }
        if (pickedImage != null) {}
        Navigator.pop(context);
      }
    }

    void handlePickingImage() async {
      final file = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        pickedImage = file;
      });
    }

    var imageExists = pickedImage != null || edit;
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${edit ? 'Edit' : 'Add'} Product'),
          actions: [
            if (edit)
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  context.read<ProductModel>().deleteProduct(widget.product!);
                },
              )
          ],
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!imageExists) Icon(Icons.image),
                    if (imageExists)
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                            pickedImage != null
                                ? pickedImage!.path
                                : '$BASEURL/products/images/${widget.product!.image}',
                            fit: BoxFit.cover),
                      ),
                    ElevatedButton(
                      child: Text('${edit ? 'Change' : 'Update'} Image'),
                      onPressed: handlePickingImage,
                    )
                  ],
                ),
                TextFormField(
                  initialValue: widget.product?.name,
                  decoration: InputDecoration(
                    labelText: 'Enter Name',
                    hintText: widget.product?.name,
                  ),
                  onSaved: (value) {
                    product = product?.copyWith(name: value);
                  },
                ),
                TextFormField(
                  initialValue: widget.product?.price.toString(),
                  decoration: InputDecoration(
                      labelText: 'Enter Price',
                      hintText: widget.product?.price.toString()),
                  onSaved: (value) {
                    product = product?.copyWith(price: double.parse(value!));
                  },
                ),
                TextFormField(
                  initialValue: widget.product?.quantity.toString(),
                  decoration: InputDecoration(
                      labelText: 'Enter Quantity',
                      hintText: widget.product?.quantity.toString()),
                  onSaved: (value) {
                    product = product?.copyWith(quantity: int.parse(value!));
                    product = product?.copyWith(initialQuantity: int.parse(value!));
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: edit ? handleUpdating : handleAdding,
        ),
      ),
    );
  }
}

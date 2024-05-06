class ProductModel{
  final String name;

  ProductModel({
    required this.name,
});

  factory ProductModel.fromJson(Map<String,dynamic>json){
    return ProductModel(name:json['name']);
  }
}
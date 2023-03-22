import 'dart:convert';

FiestModel fiestModelFromJson(String str) =>
    FiestModel.fromJson(json.decode(str));

String fiestModelToJson(FiestModel data) => json.encode(data.toJson());

class FiestModel {
  FiestModel({
    this.success,
    this.data,
  });

  bool? success;
  Data? data;

  factory FiestModel.fromJson(Map<String, dynamic> json) => FiestModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.category,
    this.products,
    this.selectedCategory,
  });

  ChildCategoryElement? category;
  List<Product>? products;
  List<String>? selectedCategory;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    category: ChildCategoryElement.fromJson(json["category"]),
    products: List<Product>.from(
        json["products"].map((x) => Product.fromJson(x))),
    selectedCategory:
    List<String>.from(json["selected_category"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "category": category!.toJson(),
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    "selected_category":
    List<dynamic>.from(selectedCategory!.map((x) => x)),
  };
}

class ChildCategoryElement {
  ChildCategoryElement({
    this.categoryId,
    this.parentCategoryId,
    this.name,
    this.description,
    this.slug,
    this.image,
    this.mobileBanner,
    this.desktopBanner,
    this.status,
    this.sortOrder,
    this.top,
    this.themeFolder,
    this.controller,
    this.createdAt,
    this.updatedAt,
    this.metaTitle,
    this.metaDescription,
    this.childCategories,
    this.productsCount,
  });

  int? categoryId;
  int? parentCategoryId;
  String? name;
  dynamic description;
  String? slug;
  dynamic image;
  dynamic mobileBanner;
  dynamic desktopBanner;
  int? status;
  int? sortOrder;
  int? top;
  ThemeFolder? themeFolder;
  Controller? controller;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic metaTitle;
  dynamic metaDescription;
  List<ChildCategoryElement>? childCategories;
  int? productsCount;

  factory ChildCategoryElement.fromJson(Map<String, dynamic> json) =>
      ChildCategoryElement(
        categoryId: json["category_id"],
        parentCategoryId: json["parent_category_id"],
        name: json["name"],
        description: json["description"],
        slug: json["slug"],
        image: json["image"],
        mobileBanner: json["mobile_banner"],
        desktopBanner: json["desktop_banner"],
        status: json["status"],
        sortOrder: json["sort_order"],
        top: json["top"],
        themeFolder: themeFolderValues.map![json["theme_folder"]],
        controller: controllerValues.map![json["controller"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        childCategories: json["child_categories"] == null
            ? null
            : List<ChildCategoryElement>.from(json["child_categories"]
            .map((x) => ChildCategoryElement.fromJson(x))),
        productsCount:
        json["products_count"] == null ? null : json["products_count"],
      );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "parent_category_id": parentCategoryId,
    "name": name,
    "description": description,
    "slug": slug,
    "image": image,
    "mobile_banner": mobileBanner,
    "desktop_banner": desktopBanner,
    "status": status,
    "sort_order": sortOrder,
    "top": top,
    "theme_folder": themeFolderValues.reverse![themeFolder],
    "controller": controllerValues.reverse![controller],
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "child_categories": childCategories == null
        ? null
        : List<dynamic>.from(childCategories!.map((x) => x.toJson())),
    "products_count": productsCount == null ? null : productsCount,
  };
}

enum Controller { PRODUCT_CUSTOM }

final controllerValues =
EnumValues({"ProductCustom": Controller.PRODUCT_CUSTOM});

enum ThemeFolder { SGF }

final themeFolderValues = EnumValues({"SGF": ThemeFolder.SGF});

class Product {
  Product({
    this.productId,
    this.feedPrice,
    this.name,
    this.slug,
    this.images,
    this.category,
  });

  int? productId;
  String? feedPrice;
  String? name;
  String? slug;
  List<Image>? images;
  List<ProductCategory>? category;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    feedPrice: json["feed_price"],
    name: json["name"],
    slug: json["slug"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    category: List<ProductCategory>.from(
        json["category"].map((x) => ProductCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "feed_price": feedPrice,
    "name": name,
    "slug": slug,
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "category": List<dynamic>.from(category!.map((x) => x.toJson())),
  };
}

class ProductCategory {
  ProductCategory({
    this.productId,
    this.categoryId,
    this.category,
  });

  int? productId;
  int? categoryId;
  ChildCategoryElement? category;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        productId: json["product_id"],
        categoryId: json["category_id"],
        category: ChildCategoryElement.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "category_id": categoryId,
    "category": category!.toJson(),
  };
}

class Image {
  Image({
    this.productImageId,
    this.productId,
    this.image,
    this.sortOrder,
  });

  int? productImageId;
  int? productId;
  String? image;
  int? sortOrder;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    productImageId: json["product_image_id"],
    productId: json["product_id"],
    image: json["image"],
    sortOrder: json["sort_order"],
  );

  Map<String, dynamic> toJson() => {
    "product_image_id": productImageId,
    "product_id": productId,
    "image": image,
    "sort_order": sortOrder,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.cartCount,
    this.cartProducts,
    this.cartPriceTotal,
    this.footerPages,
    this.sgfCategory,
  });

  int? cartCount;
  List<dynamic>? cartProducts;
  int? cartPriceTotal;
  List<FooterPage>? footerPages;
  SgfCategory? sgfCategory;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        cartCount: json["cart_count"],
        cartProducts: List<dynamic>.from(json["cartProducts"].map((x) => x)),
        cartPriceTotal: json["cartPriceTotal"],
        footerPages: List<FooterPage>.from(
            json["footer_pages"].map((x) => FooterPage.fromJson(x))),
        sgfCategory: SgfCategory.fromJson(json["sgf_category"]),
      );

  Map<String, dynamic> toJson() => {
        "cart_count": cartCount,
        "cartProducts": List<dynamic>.from(cartProducts!.map((x) => x)),
        "cartPriceTotal": cartPriceTotal,
        "footer_pages": List<dynamic>.from(footerPages!.map((x) => x.toJson())),
        "sgf_category": sgfCategory!.toJson(),
      };
}

class FooterPage {
  FooterPage({
    this.title,
    this.slug,
    this.status,
  });

  String? title;
  String? slug;
  int? status;

  factory FooterPage.fromJson(Map<String, dynamic> json) => FooterPage(
        title: json["title"],
        slug: json["slug"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "status": status,
      };
}

class SgfCategory {
  SgfCategory({
    this.categoryId,
    this.name,
    this.slug,
    this.childCategories,
  });

  int? categoryId;
  String? name;
  String? slug;
  List<ChildCategory>? childCategories;

  factory SgfCategory.fromJson(Map<String, dynamic> json) => SgfCategory(
        categoryId: json["category_id"],
        name: json["name"],
        slug: json["slug"],
        childCategories: List<ChildCategory>.from(
            json["child_categories"].map((x) => ChildCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "name": name,
        "slug": slug,
        "child_categories":
            List<dynamic>.from(childCategories!.map((x) => x.toJson())),
      };
}

class ChildCategory {
  ChildCategory({
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

  factory ChildCategory.fromJson(Map<String, dynamic> json) => ChildCategory(
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
      };
}

enum Controller { PRODUCT_CUSTOM }

final controllerValues =
    EnumValues({"ProductCustom": Controller.PRODUCT_CUSTOM});

enum ThemeFolder { SGF }

final themeFolderValues = EnumValues({"SGF": ThemeFolder.SGF});

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

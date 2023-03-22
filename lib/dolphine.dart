class dolphin {
  int? cartCount;
  List<Null>? cartProducts;
  int? cartPriceTotal;
  List<FooterPages>? footerPages;
  SgfCategory? sgfCategory;

  dolphin(
      {this.cartCount,
      this.cartProducts,
      this.cartPriceTotal,
      this.footerPages,
      this.sgfCategory});

  dolphin.fromJson(Map<String, dynamic> json) {
    cartCount = json['cart_count'];
    if (json['cartProducts'] != null) {
      cartProducts = <Null>[];
      json['cartProducts'].forEach((v) {
        cartProducts!;
      });
    }
    cartPriceTotal = json['cartPriceTotal'];
    if (json['footer_pages'] != null) {
      footerPages = <FooterPages>[];
      json['footer_pages'].forEach((v) {
        footerPages!.add(FooterPages.fromJson(v));
      });
    }
    sgfCategory = json['sgf_category'] != null
        ? SgfCategory.fromJson(json['sgf_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cart_count'] = cartCount;
    if (cartProducts != null) {
      data['cartProducts'] = cartProducts!.toList();
    }
    data['cartPriceTotal'] = cartPriceTotal;
    if (footerPages != null) {
      data['footer_pages'] = footerPages!.map((v) => v.toJson()).toList();
    }
    if (sgfCategory != null) {
      data['sgf_category'] = sgfCategory!.toJson();
    }
    return data;
  }
}

class FooterPages {
  String? title;
  String? slug;
  int? status;

  FooterPages({this.title, this.slug, this.status});

  FooterPages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['slug'] = slug;
    data['status'] = status;
    return data;
  }
}

class SgfCategory {
  int? categoryId;
  String? name;
  String? slug;
  List<ChildCategories>? childCategories;

  SgfCategory({this.categoryId, this.name, this.slug, this.childCategories});

  SgfCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    slug = json['slug'];
    if (json['child_categories'] != null) {
      childCategories = <ChildCategories>[];
      json['child_categories'].forEach((v) {
        childCategories!.add(ChildCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['category_id'] = categoryId;
    data['name'] = name;
    data['slug'] = slug;
    if (childCategories != null) {
      data['child_categories'] =
          childCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildCategories {
  int? categoryId;
  int? parentCategoryId;
  String? name;
  Null? description;
  String? slug;
  Null? image;
  Null? mobileBanner;
  Null? desktopBanner;
  int? status;
  int? sortOrder;
  int? top;
  String? themeFolder;
  String? controller;
  String? createdAt;
  String? updatedAt;
  Null? metaTitle;
  Null? metaDescription;

  ChildCategories(
      {this.categoryId,
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
      this.metaDescription});

  ChildCategories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    parentCategoryId = json['parent_category_id'];
    name = json['name'];
    description = json['description'];
    slug = json['slug'];
    image = json['image'];
    mobileBanner = json['mobile_banner'];
    desktopBanner = json['desktop_banner'];
    status = json['status'];
    sortOrder = json['sort_order'];
    top = json['top'];
    themeFolder = json['theme_folder'];
    controller = json['controller'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['category_id'] = categoryId;
    data['parent_category_id'] = parentCategoryId;
    data['name'] = name;
    data['description'] = description;
    data['slug'] = slug;
    data['image'] = image;
    data['mobile_banner'] = mobileBanner;
    data['desktop_banner'] = desktopBanner;
    data['status'] = status;
    data['sort_order'] = sortOrder;
    data['top'] = top;
    data['theme_folder'] = themeFolder;
    data['controller'] = controller;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    return data;
  }
}

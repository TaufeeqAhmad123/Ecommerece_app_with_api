class ProductModel {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  ProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: (json['products'] as List<dynamic>?)
                ?.map((e) => Product.fromJson(e))
                .toList() ??
            [],
        total: json['total'] ?? 0,
        skip: json['skip'] ?? 0,
        limit: json['limit'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'products': products.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };
}

class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        category: json['category'] ?? '',
        price: (json['price'] ?? 0).toDouble(),
        discountPercentage: (json['discountPercentage'] ?? 0).toDouble(),
        rating: (json['rating'] ?? 0).toDouble(),
        stock: json['stock'] ?? 0,
        tags: List<String>.from(json['tags'] ?? []),
        brand: json['brand'] ?? '',
        sku: json['sku'] ?? '',
        weight: (json['weight'] ?? 0).toDouble(),
        dimensions: Dimensions.fromJson(json['dimensions'] ?? {}),
        warrantyInformation: json['warrantyInformation'] ?? '',
        shippingInformation: json['shippingInformation'] ?? '',
        availabilityStatus: json['availabilityStatus'] ?? '',
        reviews: (json['reviews'] as List<dynamic>?)
                ?.map((e) => Review.fromJson(e))
                .toList() ??
            [],
        returnPolicy: json['returnPolicy'] ?? '',
        minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,
        meta: Meta.fromJson(json['meta'] ?? {}),
        images: List<String>.from(json['images'] ?? []),
        thumbnail: json['thumbnail'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'tags': tags,
        'brand': brand,
        'sku': sku,
        'weight': weight,
        'dimensions': dimensions.toJson(),
        'warrantyInformation': warrantyInformation,
        'shippingInformation': shippingInformation,
        'availabilityStatus': availabilityStatus,
        'reviews': reviews.map((e) => e.toJson()).toList(),
        'returnPolicy': returnPolicy,
        'minimumOrderQuantity': minimumOrderQuantity,
        'meta': meta.toJson(),
        'images': images,
        'thumbnail': thumbnail,
      };
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: (json['width'] ?? 0).toDouble(),
        height: (json['height'] ?? 0).toDouble(),
        depth: (json['depth'] ?? 0).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'width': width,
        'height': height,
        'depth': depth,
      };
}

class Review {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json['rating'] ?? 0,
        comment: json['comment'] ?? '',
        date: json['date'] ?? '',
        reviewerName: json['reviewerName'] ?? '',
        reviewerEmail: json['reviewerEmail'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'rating': rating,
        'comment': comment,
        'date': date,
        'reviewerName': reviewerName,
        'reviewerEmail': reviewerEmail,
      };
}

class Meta {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: json['createdAt'] ?? '',
        updatedAt: json['updatedAt'] ?? '',
        barcode: json['barcode'] ?? '',
        qrCode: json['qrCode'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'barcode': barcode,
        'qrCode': qrCode,
      };
}

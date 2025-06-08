class ImageModel {
  final String imageUrl;
  final String? smallImageUrl;
  final String? mediumImageUrl;
  final String? largeImageUrl;
  final String? maximumImageUrl;

  const ImageModel({
    required this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  ImageModel.fromJson(Map<String, dynamic> json)
    : imageUrl = json['image_url'],
      smallImageUrl = json['small_image_url'],
      mediumImageUrl = json['medium_image_url'],
      largeImageUrl = json['large_image_url'],
      maximumImageUrl = json['maximum_image_url'];
}

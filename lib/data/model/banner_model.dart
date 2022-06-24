class BannerModel {
  List<String> imageUrls;

  BannerModel({
    required this.imageUrls,
  });
}

var bannerList = BannerModel(
  imageUrls: [
    'https://storage.googleapis.com/udp_bucket/banner%201%20rev.png',
    'https://storage.googleapis.com/udp_bucket/banner%202.png',
    'https://storage.googleapis.com/udp_bucket/banner%203.png',
  ],
);

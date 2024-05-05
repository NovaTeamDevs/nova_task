import 'package:get/get.dart';
import 'package:nova_task/gen/assets.gen.dart';

class CategoryController extends GetxController {
  int selectedIcon = 0;
  final List iconList = [
    Assets.svgs.aperture,
    Assets.svgs.archive,
    Assets.svgs.atSign,
    Assets.svgs.bell,
    Assets.svgs.bookOpen,
    Assets.svgs.box,
    Assets.svgs.briefcase,
    Assets.svgs.chrome,
    Assets.svgs.clock,
    Assets.svgs.coffee,
    Assets.svgs.cpu,
    Assets.svgs.creditCard,
    Assets.svgs.delete,
    Assets.svgs.dollarSign,
    Assets.svgs.edit,
    Assets.svgs.eye,
    Assets.svgs.feather,
    Assets.svgs.figma,
    Assets.svgs.gitPullRequest,
    Assets.svgs.github,
    Assets.svgs.gitlab,
    Assets.svgs.globe,
    Assets.svgs.headphones,
    Assets.svgs.image,
    Assets.svgs.instagram,
    Assets.svgs.link,
    Assets.svgs.linkedin,
    Assets.svgs.lock,
    Assets.svgs.mapPin,
    Assets.svgs.music,
    Assets.svgs.pocket,
    Assets.svgs.qrcode,
    Assets.svgs.send,
    Assets.svgs.shoppingBag,
    Assets.svgs.slack,
    Assets.svgs.smile,
    Assets.svgs.speaker,
    Assets.svgs.star,
    Assets.svgs.target,
    Assets.svgs.thermometer,
    Assets.svgs.tool,
    Assets.svgs.truck,
    Assets.svgs.tv,
    Assets.svgs.twitch,
    Assets.svgs.twitter,
    Assets.svgs.watch,
    Assets.svgs.youtube
  ];

  void updateIcon(int newIconIndex) {
    selectedIcon = newIconIndex;
    update();
  }
}
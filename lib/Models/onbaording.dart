import '../Utils/images.dart';

class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> demoData = [
  OnBoard(
    image: Images.SPLASH,
    title: "20% Discount New Arrival",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  OnBoard(
    image: Images.SPLASH,
    title: "Take Advantage Of The Other Shopping",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  OnBoard(
    image: Images.SPLASH,
    title: "20% Discount New Arrival",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
];

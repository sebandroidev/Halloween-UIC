class Item {
  final String title;
  final String price;
  final String image;
  final String category;
  bool favorite;

  Item(
      {required this.title,
      required this.price,
      required this.image,
      this.category = "Soft Toy",
      this.favorite = false});
}

final List<Item> itemsList = [
  Item(
      title: 'Dracula',
      image: 'assets/images/Image.png',
      price: '7,90',
      favorite: true),
  Item(
    title: 'Wizard on a broom',
    image: 'assets/images/Image-1.png',
    price: '3,50',
  ),
  Item(
      title: 'Cryin Tree 🎃',
      image: 'assets/images/Image-2.png',
      price: '5,55',
      favorite: true),
  Item(
      title: 'Scarecrow',
      image: 'assets/images/Image-3.png',
      price: '2,75',
      favorite: true),
  Item(
    title: 'Reaper',
    image: 'assets/images/Image-4.png',
    price: '8,50',
  ),
  Item(
    title: 'Sugar Tree',
    image: 'assets/images/Image-5.png',
    price: '1,35',
  ),
  Item(
    title: 'Angry Franckeinstein',
    image: 'assets/images/Image-6.png',
    price: '10,12',
  ),
  Item(
    title: 'Dracula',
    image: 'assets/images/Image-7.png',
    price: '7,90',
  ),
  Item(
    title: 'Dracula',
    image: 'assets/images/Image-8.png',
    price: '7,90',
  ),
  Item(
    title: 'Dracula',
    image: 'assets/images/Image-9.png',
    price: '7,90',
  ),
  Item(
    title: 'Dracula',
    image: 'assets/images/Image-10.png',
    price: '7,90',
  ),
  Item(
    title: 'Dracula',
    image: 'assets/images/Image-11.png',
    price: '7,90',
  ),
  Item(
    title: 'Dracula',
    image: 'assets/images/Image-12.png',
    price: '7,90',
  ),
  Item(
    title: 'Dracula',
    image: 'assets/images/Image-13.png',
    price: '7,90',
  ),
  Item(
    title: 'Dracula',
    image: 'assets/images/Image-14.png',
    price: '7,90',
  ),
  Item(
    title: 'Dracula',
    image: 'assets/images/Image-5.png',
    price: '7,90',
  ),
  Item(
    title: 'Dracula',
    image: 'assets/images/Image-5.png',
    price: '7,90',
  ),
];

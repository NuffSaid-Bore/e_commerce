class Category{
  final String name,image;

  Category({required this.name, required this.image});
}

List<Category> category =[
  Category(name: 'Women', image: ''),
  Category(name: 'Men', image: ''),
  Category(name: 'Kids', image: ''),
  Category(name: 'Teen', image: ''),
  Category(name: 'Baby', image: ''),

];

List<String> filterCategory = [
  'Filter',
  'Rating',
  'Size',
  'Color',
  'Price',
  'Brand',
];
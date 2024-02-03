### The Code :

```dart
class Product {
  String name;
  double price;
  double discount;
  int stock;
  String category;

  Product(this.name, this.price, this.discount, this.stock, this.category);
}

void main() {
  var product = Product('Shoes', 150.0, 20.0, 50, 'Fashion');
  final Product(
    :price,
    :name,
    :discount,
    :stock,
    :category,
  ) = product;

  print('Product Name: $name');
  print('Price: \$${price.toStringAsFixed(2)}');
  print('Discount: ${discount.toStringAsFixed(2)}%');
  print('Stock: $stock');
  print('Category: $category');
}
```

### Result

```
Product Name: Shoes
Price: $150.00
Discount: 20.00%
Stock: 50
Category: Fashion

```

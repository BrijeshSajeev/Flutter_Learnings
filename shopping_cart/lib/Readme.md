## Pop() function can return values as a promise and then can be used in async/await

from 1 class
Navigator.of(context).pop(
GroceryItem(
id: DateTime.now().toString(),
name: \_selectedName,
quantity: \_selectedQuantity,
category: \_selectedCategory,
),
);
from class 2
void \_addItem() async {
final newItem = await Navigator.of(context).push<GroceryItem>(
MaterialPageRoute(
builder: (context) => const NewItem(),
),
);
if (newItem == null) {
return;
}
setState(() {
\_groceryItems.add(newItem);
});
}

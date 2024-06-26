import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meals.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildListWithIcon(List<String> items, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    iconData,
                    color: Theme.of(context).colorScheme.onBackground,
                    size: 12,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      items[index],
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final isFav = ref
                  .read(favoriteMealsProvider.notifier)
                  .toogleFavoriteMealStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(
                      isFav ? 'Added to Favoiate' : 'Removed from favroite'),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween(
                  begin: 0.8,
                  end: 1.0,
                ).animate(animation),
                child: child,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                // borderRadius:
                //     // BorderRadius.circular(8), // Adjust the radius as needed
                child: Hero(
                  tag: meal.id,
                  child: Image.network(
                    meal.imageUrl,
                    height: 280,
                    // width: 10,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle(context, "Ingredients :)"),
            const SizedBox(height: 14),
            _buildListWithIcon(meal.ingredients, Icons.restaurant),
            const SizedBox(height: 20),
            _buildSectionTitle(context, "Steps :)"),
            const SizedBox(height: 14),
            _buildListWithIcon(meal.steps, Icons.arrow_forward_rounded),
            const SizedBox(height: 84),
          ],
        ),
      ),
    );
  }
}

/*
return Scaffold(
      appBar: AppBar(
          title: Text(
        meal.title,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ing in meal.ingredients)
              Text(
                ing,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      // fontWeight: FontWeight.bold,
                    ),
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final step in meal.steps)
              Text(
                step,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      // fontWeight: FontWeight.bold,
                    ),
              ),
          ],
        ),
      ),
    );
*/
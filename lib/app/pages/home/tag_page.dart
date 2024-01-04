import 'package:flutter/material.dart';
import '../../data/models/produto_model.dart';
import '../../data/repositories/produto_repository.dart';
import '../products_tag_page.dart';

class TagPage extends StatelessWidget {
  final List<String> tags = [
    "Apple",
    "Samsung",
    "OPPO",
    "Huawei",
    "Microsoft Surface",
    "Infinix",
    "HP Pavilion",
    "Impression of Acqua Di Gio",
    "Royal_Mirage",
    "Fog Scent Xpressio",
    "Al Munakh",
    "Lord - Al-Rehab",
    "L'Oreal Paris",
    "Hemani Tea",
    "Dermive",
    "ROREC White Rice",
    "Fair & Clear",
    "Saaf & Khaas",
    "Bake Parlor Big",
    "Baking Food Items",
    "fauji",
    "Dry Rose",
    "Boho Decor",
    "Flying Wooden",
    "LED Lights",
    "luxury palace",
    "Golden",
  ];

  final IProdutoReposity produtoRepository;

  TagPage({required this.produtoRepository});

  @override
  Widget build(BuildContext context) {
    tags.sort();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tags Search"),
      ),
      body: Wrap(
        alignment: WrapAlignment.start,
        spacing: 5.0,
        runSpacing: 5.0,
        children: tags.map((tag) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: ActionChip(
              label: Text(tag),
              onPressed: () {
                _showProductsByTag(context, tag);
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Future<void> _showProductsByTag(BuildContext context, String tag) async {
    try {
      final List<ProdutoModel> allProducts = await produtoRepository.getProdutos();

      final List<ProdutoModel> filteredProducts = allProducts
          .where((produto) => produto.brand == tag)
          .toList();

      if (filteredProducts.isNotEmpty) {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductsPage(products: filteredProducts),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No products found for the tag $tag.'),
          ),
        );
      }
    } catch (e) {
      print("Error getting products: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error getting products. Try again later.'),
        ),
      );
    }
  }
}

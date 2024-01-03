import 'package:flutter/material.dart';
import 'package:store_flutter/app/data/models/produto_model.dart';

class ProductsPage extends StatelessWidget {
  final List<ProdutoModel> products;

  ProductsPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: _buildProductsList(),
    );
  }

  Widget _buildProductsList() {
    if (products.isEmpty) {
      return Center(
        child: Text(
          'Nenhum item na lista',
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 32),
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (_, index) {
          final item = products[index];
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  item.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'US\$ ${item.price}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Stock: ${item.stock.toInt()}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.description,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
  }
}

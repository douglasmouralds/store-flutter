import 'dart:convert';
import '../http/exceptions.dart';
import '../http/http_client.dart';
import '../models/produto_model.dart';

abstract class IProdutoReposity {
  Future<List<ProdutoModel>> getProdutos();
}

class ProdutoRepository implements IProdutoReposity {
  final IHttpClient client;

  ProdutoRepository({required this.client});

  @override
  Future<List<ProdutoModel>> getProdutos() async {
    try {
      final response = await client.get(
        url: 'https://dummyjson.com/products',
      );

      if (response.statusCode == 200) {
        final List<ProdutoModel> produtos = [];

        final body = jsonDecode(response.body);

        if (body.containsKey('products') && body['products'] is List) {

          body['products'].forEach((item) {
            final ProdutoModel produto = ProdutoModel.fromMap(item);
            produtos.add(produto);
          });

          return produtos;
        } else {
          throw Exception('Invalid response format');
        }
      } else if (response.statusCode == 404) {
        throw NotFoundException('The URL provided is not valid');
      } else {
        throw Exception('Unable to load products');
      }
    } catch (e) {
      print("Error getting products: $e");
      throw Exception('Error getting products');
    }
  }
}

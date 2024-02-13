import 'package:flutter/material.dart';
import 'package:url_json/model/post_model.dart';
import 'package:url_json/services/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getpost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        title: const Text(
          'Url Json',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
          future: getpost(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Product> products = snapshot.data;
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.amber[100],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 12.0),
                        child: ListTile(
                          leading: SizedBox(
                            width: 50,
                            child: Image.network(
                              products[index].thumbnail.toString(),
                            ),
                          ),
                          title: Text(products[index].title),
                          subtitle: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                products[index].description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )),
                              Text(products[index].price.toString()),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}

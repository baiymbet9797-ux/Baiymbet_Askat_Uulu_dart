/*import 'package:flutter/material.dart';

class MarketApp extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MarketPage(),
    );
  }
}
class MarketPage extends StatefulWidget{
  @override
  State<MarketPage> createState() => MarketPageState(); 
  }

class MarketPageState extends State<MarketPage>{
  final Map<String, List<String>> productByCategory ={
    'Ноутбуки': ['Ноутбук Lenovo', 'Ноутбук Asus','Ноутбук HP',],
    'Смартфоны': ['IPhone 18 Pro', 'Samsung Galaxy','Xiaomi Redmi',],
    'Аксессуары': ['Наушники', 'Клавиатура','Мышь',],
  };
  Set<String> favorites={};
  int currentIndex = 0;

  void toggleFavorite(String product){
    setState((){
      if(favorites.contains(product)){
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
  });
    }
    Widget buildProductList(List<String> products){
      if(products.isEmpty){
        return Center(
          child: Text('Список пуст'),
        );
      }
      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index){
          String product = products[index];
          bool isFavorite = favorites.contains(product);
          return ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text(product, style: TextStyle(fontSize: 16),),
            subtitle: Text('Товар есть в наличии'),
            trailing: IconButton(onPressed: (){
              toggleFavorite(product);
            }, icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey),
              ),
            
          );
        
        }
      );
    }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4,
     child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          currentIndex == 0 ? 'Каталог товаров' : currentIndex == 1 
          ? 'Избранное' : 'Профиль',
        ),
        bottom: currentIndex == 0 ? TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.blueGrey,
          indicatorColor: Colors.blue,
          indicatorWeight: 2,
          tabs: [
            Tab(text: 'Ноутбуки'),
            Tab(text: 'Смартфоны'),
            Tab(text: 'Аксессуары'),
            Tab(text: 'Все товары'),
          ],
        ): null,
      ),
      body: currentIndex = 0 ? TabBarView(
        children: [
        buildProductList(productByCategory['Ноутбуки']!),
        buildProductList(productByCategory['Смартфоны']!),
        buildProductList(productByCategory['Аксессуары']!),
        buildProductList(productByCategory['Все товары']!),
        buildProductList(productByCategory.values.expand((procts) => produts)
        .toList(),
        ),
        ]
        ): currentIndex == 1
        ? buildProductList(favorites.toList()) : Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.centr,
            children: [
              Icon(Icons.person, size: 60, color: Colors.amber),
              SizedBox(16),
              Text('Профиль пользователя', style: TextStyle(fontSize: 24),),
          )
            ]
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(currentIndex: currentIndex,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.amber,
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Избранное'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
        ),
    
     ),
     );
  }
  }
*/
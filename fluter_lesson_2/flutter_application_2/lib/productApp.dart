import 'package:flutter/material.dart';
class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(title: Text('Товары'), backgroundColor: Colors.amber),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [

                  Expanded(
                    
                    child: ProductCard(
                      image: 'images/photo_5458422435993558844_m.jpg',
                      title: 'Nike Air Max',
                      category: 'Shoes',
                      rating: 4,
                      price: '\$120',
                      sale: true,
                    ),
                  ),

                  SizedBox(width: 12),
                   Expanded(
                    
                    child: ProductCard(
                      image: 'images/dress.jpg',
                      title: 'Dior Dress',
                      category: 'Clothes',
                      rating: 5,
                      price: '\$3800',
                      sale: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              Row(
                children: [
                   Expanded(
                    child: ProductCard(
                      image: 'images/headphon.jpg',
                      title: 'JBL Headphone',
                      category: 'Gadget',
                      rating: 3,
                      price: '\$245',
                      sale: true,
                    ),
                  ),
                  SizedBox(width: 12),
                   Expanded(
                    child: ProductCard(
                      image: 'images/iphone17.jpg',
                      title: 'APPLE iPhone 17 Pro Max',
                      category: 'Phone',
                      rating: 3,
                      price: '\$2500',
                      sale: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              Row(
                children: [
                   Expanded(
                    child: ProductCard(
                      image: 'images/leatherbag.jpg',
                      title: 'Leather Bag',
                      category: 'Bags',
                      rating: 4,
                      price: '\$85',
                      sale: true,
                    ),
                  ),

                  SizedBox(width: 12),

                   Expanded(
                    child: ProductCard(
                      image: 'images/fitnesbag.jpg',
                      title: 'Fitnes Bag',
                      category: 'Bags',
                      rating: 2,
                      price: '\$145',
                      sale: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              Row(
                children: [
                   Expanded(
                    child: ProductCard(
                      image: 'images/tshirt.jpg',
                      title: 'T-Shirt',
                      category: 'Clothes',
                      rating: 1,
                      price: '\$35',
                      sale: true,
                    ),
                  ),

                  SizedBox(width: 12),

                   Expanded(
                    child: ProductCard(
                      
                      image: 'images/smartwatch.jpg',
                      title: 'Smart Wathes',
                      category: 'Gadget',
                      rating: 3,
                      price: '\$259',
                      sale: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final bool sale;
  final String category;
  final int rating;

  ProductCard({
    required this.image,
    required this.title,
    required this.price,
    this.sale = false,
    required this.category,
    required this.rating,
    
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.amber.shade50,
            Colors.lightBlue.shade50,
          ]
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12,
           blurRadius: 6, 
           offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 120,
                    color: Colors.red,
                    child: Center(child: Text('Нет картиинки')),
                  ),
                ),
              ),

              if (sale)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Sale',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: 10),
    
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                ),
              
              SizedBox(height: 8),
            
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                ),
        
             SizedBox(height: 8),

               Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              category,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
          SizedBox(height: 8),
         Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i = 1; i <= 5; i++)
            Icon(i <= rating ? Icons.star: Icons.star_border, 
            size:16,
            color: Colors.amber),
          ],
          ),
         SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {}, 
            child: Text('Купить'),),
            SizedBox(height: 8),

            SizedBox(width: double.infinity,
            child: OutlinedButton(onPressed: (){}, 
            child: Text ("В избранное"),),
            ),
        ],
      ),
    );
  }
}

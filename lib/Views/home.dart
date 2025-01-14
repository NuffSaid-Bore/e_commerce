import 'package:e_commerce/Views/details_screen.dart';
import 'package:e_commerce/Widgets/banner.dart';
import 'package:e_commerce/Widgets/curated_items.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
       backgroundColor: Colors.deepPurple.shade200,
       body:  SingleChildScrollView(
         child: Column(
          children: [
            const SizedBox(height: 50,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20, ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('E-Com', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                 Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Iconsax.shopping_bag, size: 28,),
                    Positioned(
                      right: -3,
                      top: -5,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.deepOrange,
                          shape: BoxShape.circle
                        ),
                        child: const Text('3', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ),
           const  SizedBox(height: 20,),
           const BannerAd(),
           const Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shop By Category', style: TextStyle(fontSize: 16, letterSpacing: 0,color: Colors.black45, fontWeight: FontWeight.w600),
              ),
              Text('See All', style: TextStyle(fontSize: 16, letterSpacing: 0,color: Colors.black12, fontWeight: FontWeight.w600),
              ),
            ],
           ),
           ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  category.length,
                  (index) => InkWell(
                    onTap: () {
                    final filteredItems = fashionEcommerce
                    .where((item)=> 
                    item.category.toLowerCase() ==
                    category[index].name.toLowerCase()).toList();
                    
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepPurple,
                            backgroundImage: AssetImage(category[index].image),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category[index].name,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

           const Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Curated For You', style: TextStyle(fontSize: 16, letterSpacing: 0,color: Colors.black45, fontWeight: FontWeight.w600),
              ),
              Text('See All', style: TextStyle(fontSize: 16, letterSpacing: 0,color: Colors.black12, fontWeight: FontWeight.w600),
              ),
            ],
           ),
           ),
           SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  fashionEcommerce.length,
                  (index) {
                    final eCommmerceItems = fashionEcommerce[index];
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.symmetric(horizontal: 20)
                          : const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (_)=> ItemDetails(eCommerce: eCommmerceItems)));
                        },
                        child: CuratedItems(eCommmerceItems: eCommmerceItems, size: size),
                      ),
                    );
                  },
                ),
              ),
            ),

          ],
         ),
       ),
    );
  }
}
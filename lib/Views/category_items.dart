import 'package:e_commerce/Views/details_screen.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/model.dart';
import 'package:e_commerce/models/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CategoryItem extends StatelessWidget {
  final String category;
  final List<FappModel> categoryItems;
  const CategoryItem({super.key, 
  required this.category, 
  required this.categoryItems});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      body:  SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new),

                  ),
                  const SizedBox(width: 10,),
                   Expanded(child: 
                  SizedBox(
                    height: 45,
                      child: TextField(decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5),
                        hintText: "$category's Fashion",
                        hintStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        filled: true,
                        fillColor: Colors.white10,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(8),),
                              ),
                              prefixIcon: const Icon(Iconsax.search_normal,
                              color: Colors.black38,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                        ),
                    ),

                  ),
                ],
              ),
              ),
              const SizedBox(height: 20,),
              Padding(padding:const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: 
                  List.generate(filterCategory.length, (index)=>
                   Padding(padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.deepPurple,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(filterCategory[index],),
                        const SizedBox( width: 5,),
                        index == 0
                        ? const Icon(Icons.filter_list, size:  15,)
                        : const Icon(Icons.keyboard_arrow_down, size: 15,),
                      ],
                    ),
                  ),
                    ),
                  ),
                ),
               ),
              ),
              const SizedBox(height: 20,),
              SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  subCategory.length,
                  (index) => InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage(subCategory[index].image),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          subCategory[index].name,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(child: categoryItems.isEmpty 
            ? const Center(
              child: Text('No items Available in this category',
              style: TextStyle(fontSize: 16, 
              color: Colors.red,
              ),
              ),
            )
            : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: categoryItems.length,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                ), 
                  itemBuilder: (context, index){
                    final item =categoryItems[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>
                        ItemDetails(eCommerce: item,),
                        ),
                        );
                      },
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: item.image,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white10,
                              image: DecorationImage(
                                image: AssetImage(item.image),
                                fit: BoxFit.cover,
                                ),
                            ),
                            height: size.height*0.25,
                            width: size.width* 0.5,
                            child: const Padding(padding: EdgeInsets.all(12),
                            child: Align(alignment: Alignment.topRight, 
                            child: CircleAvatar(radius: 18, backgroundColor: Colors.black26,
                            child: Icon(Icons.favorite_border, color: Colors.white,
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 7,),
                        Row(
                          children: [
                            const Text('H&M', style:  TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.black26),),
                            const SizedBox(height: 5,),
                            const Icon(Icons.star,
                            color: Colors.amber,
                            size: 17,),
                            Text(item.rating.toString()),
                            Text('${item.review}', style: const TextStyle(color: Colors.black26),),
                          
                            
                          ],
                        ),
                        SizedBox(
                              width: size.width * 0.5 ,
                              child: Text(item.name,maxLines: 1, overflow: TextOverflow.ellipsis, 
                              style: const TextStyle(fontSize: 16, height: 1.5, fontWeight: FontWeight.w600),
                              ),
                            ),
                        Row(
                              children: [
                                Text('R${item.price + 299}.00',
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, height: 1.5,color: Colors.pink),
                                ),
                                const SizedBox(width: 5,),
                                if(item.isCheck)
                                Text('R${item.price.toString()}.00',
                                style: const TextStyle(color: Colors.black,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.black26,
                                ),
                                ),
                                
                              ],
                            ),
                      ],
                    )
                    );
                  }
              ),
              ),
          ],
        ),
      ),
    );
  }
}
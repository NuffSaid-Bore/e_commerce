import 'package:e_commerce/models/model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ItemDetails extends StatefulWidget {
  final FappModel eCommerce;
  const ItemDetails({super.key, required this.eCommerce});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int currentIndex =0 ;
    return  Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.deepPurple.shade400,
      title: const Text('Detail Product'),
      actions: [
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
      ],),
      body: ListView(
        children: [
          Container(
            color: Colors.white10,
            height: size.height * 0.46,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      widget.eCommerce.image,
                      height: size.height * 0.4,
                      width: size.width * 0.85,
                      fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: List.generate(
                          3,
                          (index) => AnimatedContainer(
                            duration: const Duration(microseconds: 300),
                            margin: const EdgeInsets.only(right: 4), 
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index == currentIndex ? Colors.blue : Colors.grey.shade400, 
                            ),
                          ),
                        ),
                      ),

                  ],
                );
            },
            ),
          ),
          Padding(padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
          children: [
            const Text('H&M', style:  TextStyle(fontWeight: FontWeight.bold,
            color: Colors.black26),),
            const SizedBox(height: 5,),
            const Icon(Icons.star,
            color: Colors.amber,
            size: 17,),
            Text(widget.eCommerce.rating.toString()),
            Text('${widget.eCommerce.review}', style: const TextStyle(color: Colors.black26),),
            SizedBox(
              width: size.width * 0.5 ,
              child: Text(widget.eCommerce.name,maxLines: 1, overflow: TextOverflow.ellipsis, 
              style: const TextStyle(fontSize: 16, height: 1.5, fontWeight: FontWeight.w600),),
            ),
            const Spacer(),
            const Icon(Icons.favorite_border),
            
          ],
        ),
        Row(
              children: [
                Text('R${widget.eCommerce.price + 200}.00',
                 style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, height: 1.5,color: Colors.pink),
                 ),
                 const SizedBox(width: 5,),
                 if(widget.eCommerce.isCheck)
                 Text('R${widget.eCommerce.price.toString()}.00',
                 style: const TextStyle(color: Colors.black,
                 decoration: TextDecoration.lineThrough,
                 decorationColor: Colors.black26,
                 ),
                 ),
                 
              ],
            ),
            ],
          ),),
        ],
      ),

    );
  }
}
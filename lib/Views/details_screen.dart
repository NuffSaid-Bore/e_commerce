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
  String myDescription= 'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.';
  int currentIndex =0 ;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return  Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.deepPurple.shade400,
      title: const Text('Detail Product'),
      actions: [
            Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Padding(padding: EdgeInsets.only(right: 6),
                    child: Icon(Iconsax.shopping_bag, size: 28,),
                    ),
                    Positioned(
                      right: -4,
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
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      ),
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
                    Hero(
                      tag: widget.eCommerce.image,
                      child: Image.asset(
                        widget.eCommerce.image,
                        height: size.height * 0.4,
                        width: size.width * 0.85,
                        fit: BoxFit.cover,
                        ),
                    ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
            
            const Spacer(),
            const Icon(Icons.favorite_border),
          ],
        ),
        SizedBox(
              width: size.width * 0.5 ,
              child: Text(widget.eCommerce.name,
              maxLines: 1, 
              style: const TextStyle(
                fontSize: 16, 
                height: 1.5, 
                fontWeight: FontWeight.w600,),
                ),
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
                const SizedBox(height: 7,),
                Text('$myDescription ${widget.eCommerce.description}',
                style: const TextStyle(fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black26,
                letterSpacing: 0.5,
                ),
                ),
                const SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width /2.1, 
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Color', 
                        style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: widget.eCommerce.fcolor.asMap().entries.map((entry){
                              final int index = entry.key;
                              final color = entry.value;
                              return  Padding(padding: const EdgeInsets.only(top: 10, right: 10),
                              child: CircleAvatar(radius: 18, backgroundColor: color,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedColorIndex = index;
                                  });
                                },
                                child: Icon(Icons.check, 
                                color:  selectedColorIndex == index 
                                ? Colors.white 
                                : Colors.transparent,),
                              ),
                              ),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                    ),
                    // For Size
                    SizedBox(width: size.width /2.4, 
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Size', 
                        style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: widget.eCommerce.size.asMap().entries.map((entry){
                              final int index = entry.key;
                              final String size = entry.value;
                              return  GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSizeIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10,top: 10),
                                  height: 35,
                                  width: 35,
                                  decoration:BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: selectedSizeIndex == index
                                    ? Colors.black 
                                    : Colors.white,
                                    border: Border.all(
                                      color: selectedSizeIndex == index
                                      ? Colors.black: Colors.black12
                                    ),
                                  ) ,
                                    child: Center(
                                      child: Text(size, 
                                      style: TextStyle(fontWeight: FontWeight.bold,
                                      color: selectedSizeIndex == index
                                      ? Colors.white
                                      : Colors.black,),
                                        ),
                                      ),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        backgroundColor: Colors.deepPurple.shade200,
        elevation: 0, 
        label: SizedBox(width: size.width * 0.9,
        child: Row(children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.shopping_bag,
                  color: Colors.black,
                  ), 
                  SizedBox(width: 5,),
                  Text('ADD TO CART', 
                  style: TextStyle(color: Colors.black,
                  letterSpacing: -1, ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10,),
           Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              color: Colors.black,
              child: const Center(
                child:  Text('BUY NOW', 
                style: TextStyle(color: Colors.white,
                letterSpacing: -1, ),
                ),
              ),
            ),
          ),
        ],),
        ),
      ),

    );
  }
}
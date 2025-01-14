import 'package:e_commerce/models/model.dart';
import 'package:flutter/material.dart';

class CuratedItems extends StatelessWidget {
  final FappModel eCommmerceItems;
  final Size size;
  const CuratedItems({super.key, required this.eCommmerceItems, required this.size});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white10,
            image: DecorationImage(
              image: AssetImage(eCommmerceItems.image),
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
        const SizedBox(height: 7,),
         Row(
          children: [
            const Text('H&M', style:  TextStyle(fontWeight: FontWeight.bold,
            color: Colors.black26),),
            const SizedBox(height: 5,),
            const Icon(Icons.star,
            color: Colors.amber,
            size: 17,),
            Text(eCommmerceItems.rating.toString()),
            Text('${eCommmerceItems.review}', style: const TextStyle(color: Colors.black26),),
            SizedBox(
              width: size.width * 0.5 ,
              child: Text(eCommmerceItems.name,maxLines: 1, overflow: TextOverflow.ellipsis, 
              style: const TextStyle(fontSize: 16, height: 1.5, fontWeight: FontWeight.w600),),
            ),
            
          ],
        ),
        Row(
              children: [
                Text('R${eCommmerceItems.price + 200}.00',
                 style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, height: 1.5,color: Colors.pink),
                 ),
                 const SizedBox(width: 5,),
                 if(eCommmerceItems.isCheck)
                 Text('R${eCommmerceItems.price.toString()}.00',
                 style: const TextStyle(color: Colors.black,
                 decoration: TextDecoration.lineThrough,
                 decorationColor: Colors.black26,
                 ),
                 ),
                 
              ],
            ),
      ],
    );
  }
}
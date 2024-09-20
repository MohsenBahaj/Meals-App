import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final void Function(Meal meal) onSelectMeal;
  const MealItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.meal,
    required this.onSelectMeal,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'simple';
        break;
      case Complexity.challenging:
        return 'challenging';
        break;
      case Complexity.hard:
        return 'hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'affordable';
        break;
      case Affordability.pricey:
        return 'pricey';
        break;
      case Affordability.luxurious:
        return 'luxurious';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectMeal(meal),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Hero(
                    tag: '$imageUrl',
                    child: Image.network(
                      imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                      height: 80,
                      width: 220,
                      color: Colors.black54,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_alarm,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '$duration min',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.work,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    complexityText,
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '$affordabilityText',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//  return Card(
//       margin: EdgeInsets.all(8),
//       clipBehavior: Clip.hardEdge,
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: InkWell(
//         child: Stack(
//           children: [
//             FadeInImage(
//               placeholder: MemoryImage(kTransparentImage),
//               image: NetworkImage(meal.imageUrl),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
//                 color: Colors.black54,
//                 child: Column(
//                   children: [
//                     Text(
//                       meal.title,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           fontSize: 20),
//                       textAlign: TextAlign.center,
//                       softWrap: true,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 2,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );

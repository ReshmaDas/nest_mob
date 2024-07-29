import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:nest_mart_and_grocery/data/banner_carousel.dart';
import 'package:nest_mart_and_grocery/data/modeProduct.dart';

class DailyBestSellPAge extends StatelessWidget {
  DailyBestSellPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
            childAspectRatio: 3 / 9),
        padding: EdgeInsets.all(8.0), // padding around the grid
        itemCount: 3, // total number of items
        itemBuilder: (context, index) {
          final Product productItems = products[index];
          return Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 188, 187, 187)),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            // color of grid items
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 100,
                    height: 80,
                    child: Image.asset(productItems.image)),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Align(
                    alignment: FractionalOffset.bottomLeft,
                    child: Text(
                      productItems.name,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 152, 149, 149),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Align(
                    alignment: FractionalOffset.bottomLeft,
                    child: Container(
                      height: 65,
                      child: Text(
                        productItems.description,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Row(
                    children: [
                      Align(
                          alignment: FractionalOffset.bottomLeft,
                          child: Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 240, 220, 45),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "(${productItems.rating})",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Row(
                    children: [
                      Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(
                          'By ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(
                          productItems.company,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                LinearProgressBar(
                  maxSteps: 6,
                  progressType: LinearProgressBar
                      .progressTypeLinear, // Use Linear progress
                  currentStep: 3,
                  progressColor: Color.fromARGB(255, 76, 175, 102),
                  backgroundColor: Colors.grey,
                  borderRadius: BorderRadius.circular(10), //  NEW
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Align(
                    alignment: FractionalOffset.bottomLeft,
                    child: Text(
                      'Sold: 90/120 ',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 158, 158, 158),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 83, 202, 87)),
                  child: Center(
                    child: Text('Add To Cart'),
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

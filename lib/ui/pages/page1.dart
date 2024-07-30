import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nest_mart_and_grocery/data/banner_carousel.dart';
import 'package:nest_mart_and_grocery/data/shoByCategoryModel.dart';
import 'package:nest_mart_and_grocery/ui/components/mytab2.dart';
import 'package:nest_mart_and_grocery/ui/components/tabController.dart';
import 'package:nest_mart_and_grocery/ui/popular_product/allProducts.dart';
import 'package:nest_mart_and_grocery/ui/popular_product/dailyBest_SellProduct.dart';
import 'package:nest_mart_and_grocery/ui/popular_product/topselling.dart';

import '../popular_product/trendingProducts.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final MyTab _tabs = Get.put(MyTab());
    final MyTab2 _tabs2 = Get.put(MyTab2());
    final MyTab3 _tabs3 = Get.put(MyTab3());

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: Image.asset(
            'assets/nest.png',
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            onTap: () {
              //   Get.to(PageOne());
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Badge(
                backgroundColor: const Color.fromARGB(255, 7, 164, 88),
                label: Text(
                  '4',
                  style: TextStyle(),
                ),
                child: Icon(
                  Icons.favorite_outline,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Badge(
              backgroundColor: const Color.fromARGB(255, 7, 164, 88),
              label: Text(
                '2',
                style: TextStyle(),
              ),
              child: Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              height: 200,
              width: double.infinity,
              child: BannerCarousel(
                margin: EdgeInsets.all(4),
                banners: listBanners,
                customizedIndicators: IndicatorModel.animation(
                    width: 20, height: 5, spaceBetween: 2, widthAnimation: 50),
                height: 200,
                activeColor: Colors.amberAccent,
                disableColor: Colors.white,
                animation: true,
                borderRadius: 10,
                width: double.infinity,
                indicatorBottom: false,
              ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: width * .4,
                      child: Image.asset('assets/shopNow2.png'),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      width: width * .4,
                      child: Image.asset('assets/shopNow2.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 22, right: 22),
              child: Text(
                'Popular Products',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 50, // Adjust this height to fit your layout
              child: TabBar(
                controller: _tabs.controller,
                tabs: _tabs.myTabs,
                labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
            Container(
              height: height * .8 - 50,
              child: TabBarView(
                controller: _tabs.controller,
                children: [
                  AllProducts(),
                  Container(color: Colors.black54),
                  Container(color: Colors.purple),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 22, right: 22),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Daily Best Sells',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            // Container(
            //   height: 200,
            //   child: DailyBestSellPAge()),

            Container(height: 400, child: DailyBestSellPAge()),

            Row(
              children: [
                Expanded(
                  child: TabBar(
                    controller: _tabs2.controller2,
                    tabs: _tabs2.myTabs2,
                  ),
                ),
                Expanded(
                  child: TabBar(
                    controller: _tabs3.controller3,
                    tabs: _tabs3.myTabs3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: height * 0.3, // Adjust this to fit your layout
              color: const Color.fromARGB(255, 216, 193, 123),
              child: Row(
                children: [
                  Expanded(
                    child: TabBarView(
                      controller: _tabs2.controller2,
                      children: [TopSellingPage()],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabs3.controller3,
                      children: [TrendingProductPage()],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Shop by Categories',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // number of items in each row
                mainAxisSpacing: 8.0, // spacing between rows
                crossAxisSpacing: 8.0, // spacing between columns
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final CategoryList items2 = items[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 245, 222, 249),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(items2.image),
                          ),
                        ),
                        Center(
                          child: Text(
                            items2.name,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.all(10),
              height: 160,
              width: width * .9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color.fromARGB(255, 185, 250, 228)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Stay home & get your daily needs from our shop',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Start Your's Daily Shopping With ",
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                          maxLines: 2,
                        ),
                      ),
                      Text(
                        "Nest Mart ",
                        style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 40,
                        width: width * .7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration:
                                InputDecoration.collapsed(hintText: 'email'),
                          ),
                        ),
                      ),
                      Positioned(
                          left: width * .5,
                          // top: 30.0,
                          child: Container(
                            width: width * .2,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 35, 153, 51)),
                            child: Center(child: Text('Subscribe')),
                          )),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

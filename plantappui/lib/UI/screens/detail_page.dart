// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:plantappui/Constants/constants.dart';
import 'package:plantappui/Models/plants.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({
    super.key,
    required this.plantId,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Toggle Favorite button
  bool toggleIsFavorated(bool isFavorated) {
    return !isFavorated;
  }

  // Toggle add remove from cart
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primarColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primarColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primarColor.withOpacity(.15),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          bool isFavorated = toggleIsFavorated(
                              _plantList[widget.plantId].isFavorited);
                          _plantList[widget.plantId].isFavorited = isFavorated;
                        });
                      },
                      icon: Icon(
                        _plantList[widget.plantId].isFavorited == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Constants.primarColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(
                        _plantList[widget.plantId].imageURL,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantFeautre(
                            title: 'Size',
                            plantFeature: _plantList[widget.plantId].size,
                          ),
                          PlantFeautre(
                            title: 'Humidity',
                            plantFeature:
                                _plantList[widget.plantId].humidity.toString(),
                          ),
                          PlantFeautre(
                            title: 'Temperature',
                            plantFeature: _plantList[widget.plantId]
                                .temperature
                                .toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 80,
                        left: 30,
                        right: 30,
                      ),
                      height: size.height * .5,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Constants.primarColor.withOpacity(.4),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _plantList[widget.plantId].plantName,
                                    style: TextStyle(
                                      color: Constants.primarColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    r'$' +
                                        _plantList[widget.plantId]
                                            .price
                                            .toString(),
                                    style: TextStyle(
                                      color: Constants.blackColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                _plantList[widget.plantId].rating.toString(),
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Constants.primarColor,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                size: 30,
                                color: Constants.primarColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Text(
                              _plantList[widget.plantId].description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 18,
                                color: Constants.blackColor.withOpacity(.7),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    bool isSelected =
                        toggleIsSelected(_plantList[widget.plantId].isSelected);
                    _plantList[widget.plantId].isSelected = isSelected;
                  });
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: _plantList[widget.plantId].isSelected == true
                      ? Colors.white
                      : Constants.primarColor,
                ),
              ),
              decoration: BoxDecoration(
                color: _plantList[widget.plantId].isSelected == true
                    ? Constants.primarColor.withOpacity(.5)
                    : Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                    color: Constants.primarColor.withOpacity(.3),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.primarColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primarColor.withOpacity(.3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Buy now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantFeautre extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeautre({
    super.key,
    required this.plantFeature,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primarColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

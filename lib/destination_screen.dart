import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/activity_model.dart';
import 'package:travel_app/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen({required this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (var i = 0; i < rating; i++) {
      stars += '*';
    }
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6,
                      ),
                    ]),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage(
                        widget.destination.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search, size: 30),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.accessible, size: 30),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.destination.city,
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2),
                    ),
                    Row(
                      children: [
                        // Icon(
                        //   FontAwesomeIcons.locationArrow,
                        //   size: 10,
                        //   color: Colors.white,
                        // ),
                        SizedBox(width: 5),
                        Text(
                          widget.destination.country,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 20,
                  child: Row(children: [
                    Icon(FontAwesomeIcons.locationArrow, color: Colors.white70),
                  ]))
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 170,
                      margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100, 20, 20, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 120,
                                    child: Text(activity.name,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '\$${activity.price}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        'per pax',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ]),
                            Text(
                              activity.type,
                              style: TextStyle(color: Colors.grey),
                            ),
                            _buildRatingStars(activity.rating),
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              Container(
                                alignment: Alignment.center,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(activity.startTimes[0]),
                              ),
                              SizedBox(width: 5),
                              Container(
                                alignment: Alignment.center,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(activity.startTimes[1]),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 15,
                      bottom: 15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          fit: BoxFit.cover,
                          width: 110,
                          image: AssetImage(
                            activity.imageUrl,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

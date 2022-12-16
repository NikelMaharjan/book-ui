import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_start_new/constants.dart';
import 'package:flutter_start_new/models/book.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.books);
  final Book books;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Color(0xFFF1F5F9),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: deviceheight * 0.38,
                  width: double.infinity,
                  child: Hero(
                    tag: books.imageUrl,
                    child: CachedNetworkImage(
                      imageUrl: books.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  // we use this column again for padding all the content from here, since padding in image above is note needed
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: deviceheight * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            books.label,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment
                                .spaceAround, // to see the effect, we wrapped with container with height
                            children: [Text(books.rating), Text(books.genre)],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      books.overview,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: deviceheight*0.07,
                          width: devicewidth*0.4,
                          child: ElevatedButton(onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                backgroundColor: Color(0xFF007083)
                              ),
                              child: Text("Read Book")),
                        ),
                        SizedBox(
                          height: deviceheight*0.07,
                          width: devicewidth*0.4,
                          child: OutlinedButton(
                              onPressed: () {},
                              child: Text("More Info"),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                                ),)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_start_new/constants.dart';
import 'package:flutter_start_new/models/book.dart';
import 'package:flutter_start_new/view/detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF1F5F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF1F5F9),
        title: Text(
          "Hi Nikel",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            color: Colors.black,
          ),
        ],
      ),
      body: book(deviceheight, devicewidth),
    );
  }


  Widget book(double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: "https://images.unsplash.com/photo-1504198322253-cfa87a0ff25f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
          height: height / 4.2,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
         SizedBox(height: 20,),
        _buildBooks(width, height),
        _buildMoreBooks(height, width)
      ],
    );
  }

  Widget _buildBooks(double width, double height) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(book)));
              },
              child: Container(
                width: width * 0.88,
                margin: EdgeInsets.only(right: 10, left: index == 0 ? 10 : 0),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: width * 0.88,
                        height: height * 0.23,
                        child: Card(
                          child: Row(
                            children: [
                              SizedBox(width: 140,),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        book.label,
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                      Text(book.overview, maxLines: 5, style: TextStyle(fontSize: 13, color: Colors.grey),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(book.rating),
                                          Text(
                                            book.genre,
                                            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.blueGrey),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Hero(
                          tag: book.imageUrl,
                          child: CachedNetworkImage(
                            placeholder: (context, str) {
                              return Center(child: CircularProgressIndicator(color: Colors.grey,),);
                            },
                            imageUrl: book.imageUrl, height: height * 0.29,
                            width: 140, fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),





                  ],
                ),
              ),
            );


            // return InkWell(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => DetailPage(book)));
            //   },
            //   child: Container(
            //     margin: EdgeInsets.only(right: 10, left: index == 0 ? 10 : 0),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         Container(
            //             //color: Colors.amber,
            //             height: height / 3,
            //             width: width / 2,
            //             child: ClipRRect(
            //               borderRadius: BorderRadius.circular(8),
            //               child: Hero(
            //                 tag: book.imageUrl,
            //                 child: CachedNetworkImage(
            //                   placeholder: (context, str) {
            //                     return Center(
            //                       child: CircularProgressIndicator(
            //                         color: Colors.grey,
            //                       ),
            //                     );
            //                   },
            //                   imageUrl: book.imageUrl,
            //                   //  fit: BoxFit.fitWidth,
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             )),
            //         Container(
            //           width: width / 2,
            //           height: height / 4,
            //           child: Card(
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text(
            //                     book.label,
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.bold, fontSize: 16),
            //                   ),
            //                   Text(
            //                     book.overview,
            //                     maxLines: 5,
            //                   ),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Text(book.rating),
            //                       Text(
            //                         book.genre,
            //                         style: TextStyle(fontStyle: FontStyle.italic),
            //                       ),
            //                     ],
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // );
          }),
    );
  }

  Widget _buildMoreBooks (double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Text(
            "You may also like",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
          height: height * 0.34,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: moreBook.length,
              itemBuilder: (context, index) {
                final book = moreBook[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(book)));},
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 4, top: 4, bottom: 8, left: index == 0 ? 2 : 0),
                            height: height / 4,
                            width: width / 3,
                            child: Hero(
                              tag: book.imageUrl, //tag name should be same with two but unique with others.
                              child: CachedNetworkImage(
                                placeholder: (context, abc) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                                imageUrl: book.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Text(
                          book.label,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(book.genre),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

}

import 'package:agriplant/models/article.dart';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../data/TrackingCard.dart';
import '../pages/product_details_page.dart';

class ProductCard extends StatelessWidget {
  
  const ProductCard({super.key,  required this.articles});


  final Article articles;

  @override
  Widget build(BuildContext context) {
        final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(articles: articles),
          ),
        );
      },
      child: SingleChildScrollView(
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.grey.shade400),
          ),
          elevation: 0.1,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200, 
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage(articles.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: IconButton.filledTonal(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      iconSize: 18,
                      icon: const Icon(IconlyLight.bookmark),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8.0), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(bottom: 3.0, left:  width * 0.02),
                        child: Text(
                          articles.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding:  EdgeInsets.only(left: width * 0.02),
                              child: Row(
                                children: [
                                  
                                  
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                                      
                                        TextSpan(
                                          text: articles.date,
                                          style: GoogleFonts.poppins().copyWith(
                                            fontSize: 12,
                                            color: Colors.black.withOpacity(0.7),
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: width * 0.03,),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                                      
                                        TextSpan(
                                          text: articles.author,
                                          style: GoogleFonts.poppins().copyWith(
                                            fontSize: 12,
                                            color: Colors.black.withOpacity(0.7),
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green, 
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                iconSize: 18,
                                icon: const Icon(Icons.favorite,
                                    color:
                                        Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:videojuegos/src/models/videojuegos_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Videojuego> listData;
  CardSwiper({@required this.listData});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return _cardSwiperLoad(screenSize, context, index);
        },
        itemCount: listData.length,
        itemWidth: screenSize.width * 0.7,
        itemHeight: screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
      ),
    );
  }

  Widget _cardSwiperLoad(Size screenSize, BuildContext context, int id) {
    final tarjetaVideojuegosGrande = ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: FadeInImage(
            placeholder: AssetImage("assets/img/loading.gif"),
            image: NetworkImage(listData[id].getImageBackGround()),
            fit: BoxFit.cover));
    return GestureDetector(
      child: tarjetaVideojuegosGrande,
      onTap: () {
        Navigator.pushNamed(context, "detalleV", arguments: listData[id].id);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Meditate2_Screen extends StatefulWidget {
  const Meditate2_Screen({Key? key}) : super(key: key);

  @override
  State<Meditate2_Screen> createState() => _Meditate2_ScreenState();
}

List<String> filters = [
  "All",
  "Bible In a Year",
  "Dailies",
  "Minutes",
  "Noven"
];

class _Meditate2_ScreenState extends State<Meditate2_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(6),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 6),
              //заголовок
              child: Row(children: const [
                Text("Meditate",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                Spacer(), // пустое регулируемое пространство, которое используется для регулировки расстояния между дочерними Widget
                Icon(Icons.search, size: 28)
              ]),
            ),
            const Divider(thickness: 1, color: Color(0xFFDDDDDD)),
            //список с объектами
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: filters
                        .mapIndexed((index, filter) => Padding(
                              padding: EdgeInsets.only(
                                  right: index == filters.length - 1 ? 0 : 6),
                              child: Container(
                                height: 32,
                                decoration: BoxDecoration(
                                  //определение цвета, если это объект "All" то цвет фона будет темноголубой иначе светлоголубой
                                  color: Color(filter == "All"
                                      ? 0xFF039EA2
                                      : 0xFFE6FeFF),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                alignment: Alignment.center,
                                child: Text(filter,
                                    style: TextStyle(
                                        //определение цвета, если это объект "All" то цвет текста будет белый иначе темноголубой
                                        color: Color(filter == "All"
                                            ? 0xFFFFFFFF
                                            : 0xFF039EA2))),
                              ),
                            ))
                        .toList())),
            //список элементов(карточек объектов)
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 4, right: 4),
              //основной - главный
              child: Card(
                  "A Song of Moon",
                  "Start with the basics",
                  "9 Sessions",
                  Image.asset("assets/images/meditate2_screen_Img3.png")),
            ),
            const Divider(thickness: 1, color: Color(0xFFDDDDDD)),
            //первые два объекта
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Card(
                          "The Sleep Hour",
                          "Asha Mukherjee",
                          "3 Sessions",
                          style: CardStyle.small,
                          Image.asset(
                              "assets/images/meditate2_screen_Img4.png"))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Card(
                          "Easy on the Mission",
                          "Peter Mach",
                          "5 minutes",
                          style: CardStyle.small,
                          Image.asset(
                              "assets/images/meditate2_screen_Img2.png"))),
                ],
              ),
            ),
            const Divider(thickness: 1, color: Color(0xFFDDDDDD)),
            //остальные две карточки
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Card(
                          "Relax with Me",
                          "Amanda James",
                          "3 Sessions",
                          style: CardStyle.small,
                          Image.asset(
                              "assets/images/meditate2_screen_Img1.png"))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Card(
                          "Sun and Energy",
                          "Mitcheal Hui",
                          "5 minutes",
                          style: CardStyle.small,
                          Image.asset(
                              "assets/images/meditate2_screen_Img4.png"))),
                ],
              ),
            ),
            const Divider(thickness: 1, color: Color(0xFFDDDDDD)),
          ]),
        ),
      ),
    ));
  }
}

enum CardStyle { big, small }

//класс карточек с информацией
class Card extends StatelessWidget {
  const Card(this.name, this.info, this.value, this.image,
      {Key? key, this.style = CardStyle.big})
      : super(key: key);

  final String name;
  final String info;
  final String value;
  final Widget image;
  final CardStyle style;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      //обложка
      image,
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
        //объект наименование
        child: Text(name,
            style: TextStyle(
                fontSize: style == CardStyle.big
                    ? 22
                    : 16, //размер текста для объектов
                fontWeight: FontWeight.w700)), // жирность текста
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
        // объект информации
        child: Text(info,
            style: style == CardStyle.big
                ? const TextStyle(fontSize: 16)
                : const TextStyle(
                    fontSize: 13, color: Color.fromARGB(127, 0, 0, 0))),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        //строка с лайками и запуском
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 4),
              child: Icon(Icons.favorite_outline_outlined, size: 18),
            ),
            Text(value,
                style: const TextStyle(
                    fontSize: 13, color: Color.fromARGB(127, 0, 0, 0))),
            const Spacer(),
            const Text("Start >",
                style: TextStyle(
                    fontSize: 13, color: Color.fromARGB(127, 0, 0, 0))),
          ],
        ),
      )
    ]);
  }
}

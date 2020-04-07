import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skill_zycp/export_file.dart';
import 'package:skill_zycp/data/model/course_result_model.dart';
import 'package:skill_zycp/screen_sizes/size_config.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CourseBloc courseBloc;

  @override
  void initState() {
    super.initState();
    courseBloc = BlocProvider.of<CourseBloc>(context);
    courseBloc.add(FetchCourseEvent());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseIntialState) {
            return buildLoading();
          } else if (state is CourseLoadingState) {
            return buildLoading();
          } else if (state is CourseLoadedState) {
            return buildCourseList(state.course);
          } else if (state is CourseErrorState) {
            return buildErrorUi(state.message);
          } else {
            return null;
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: RaisedButton(
          onPressed: () {},
          color: Color.fromRGBO(121, 49, 135, 1),

          // padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // Replace with a Row for horizontal icon + text
            children: <Widget>[
              Text(
                "Register Now",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildCourseList(Course course) {
    SizeConfig().init(context);
    String convertToStr = course.price.toString();
    var now = new DateTime.now();
    course.date = DateFormat("yyyy-MM-dd hh:mm:ss").format(now);

    course.img = [
      "http://skillzycp.com/upload/business/389_636896432064799384.jpg",
      "http://skillzycp.com/upload/business/389_636896432315268827.jpg",
      "http://skillzycp.com/upload/business/389_636896432445581923.jpg",
      "http://skillzycp.com/upload/business/389_636896432574644899.jpg"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: SizeConfig.safeBlockHorizontal * 100,
          height: SizeConfig.safeBlockVertical * 40,
          child: Stack(
            children: <Widget>[
              Carousel(
                boxFit: BoxFit.cover,
                images: [
                  Image.network(
                    course.img[0],
                    fit: BoxFit.cover,
                    width: SizeConfig.safeBlockHorizontal * 100,
                    height: SizeConfig.safeBlockVertical * 40,
                  ),
                  Image.network(
                    course.img[1],
                    fit: BoxFit.cover,
                    width: SizeConfig.safeBlockHorizontal * 100,
                    height: SizeConfig.safeBlockVertical * 40,
                  ),
                  Image.network(
                    course.img[2],
                    fit: BoxFit.cover,
                    width: SizeConfig.safeBlockHorizontal * 100,
                    height: SizeConfig.safeBlockVertical * 40,
                  ),
                  Image.network(
                    course.img[3],
                    fit: BoxFit.cover,
                    width: SizeConfig.safeBlockHorizontal * 100,
                    height: SizeConfig.safeBlockVertical * 40,
                  ),
                ],
                dotSize: 5.0,
                dotPosition: DotPosition.bottomLeft,
                dotBgColor: Colors.transparent,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
              ),
              Positioned(
                top: 30,
                child: Container(
                  width: SizeConfig.safeBlockHorizontal * 100,
                  height: SizeConfig.safeBlockVertical * 5,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 15),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            SizedBox(width: 35),
                            Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/arrow.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 7.0),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: 7.0),
                    Text('#${course.title}'),
                    SizedBox(height: 7.0),
                    Text(course.trainerInfo),
                    SizedBox(height: 7.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(width: 5),
                        Text(course.date),
                      ],
                    ),
                    SizedBox(height: 7.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/q.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 5),
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Text(course.interest),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 1.0, right: 1.0, bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: FadeInImage.memoryNetwork(
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                              placeholder: kTransparentImage,
                              image:
                                  'http://skillzycp.com/upload/trainer/389_BaseImage_636896408382239890.jpg',
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text(course.trainerName),
                        ],
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(course.interest),
                    SizedBox(height: 17.0),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10.0),
                    Text('about Course'),
                    SizedBox(height: 15.0),
                    Text(
                      course.title,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 9.0),
                    Text('Price Course'),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Text('booking oringal'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(convertToStr),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Text('booking vip'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(convertToStr),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Text('booking faster'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(convertToStr),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      // ),
    );
  }
}

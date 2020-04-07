import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_zycp/bloc/courses/course_bloc.dart';
import 'package:skill_zycp/data/repository/course_repository.dart';
import 'package:skill_zycp/screen_sizes/size_config.dart';
import 'package:skill_zycp/ui/pages/home_page.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home:MainApp()));

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Scaffold(      
      body: Container(
        width: SizeConfig.safeBlockHorizontal * 100,
        height: SizeConfig.safeBlockVertical * 100 ,
        child: BlocProvider(
          create: (context) => CourseBloc(repository: CourseRepositoryImplementation()),
          child: HomePage(),
          ),
      ),
    );
  }
}
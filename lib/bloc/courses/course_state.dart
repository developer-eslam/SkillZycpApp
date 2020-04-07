
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:skill_zycp/data/model/course_result_model.dart';

abstract class CourseState extends Equatable {}

class CourseIntialState extends CourseState {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class CourseLoadingState extends CourseState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CourseLoadedState extends CourseState {

  Course course;
  
  CourseLoadedState({@required this.course});

  @override
  // TODO: implement props
  List<Object> get props => [course];

}

class CourseErrorState extends CourseState {

  String message;
  CourseErrorState({@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];

}
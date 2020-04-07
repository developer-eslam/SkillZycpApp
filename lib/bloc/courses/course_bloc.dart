import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:skill_zycp/bloc/courses/course_event.dart';
import 'package:skill_zycp/bloc/courses/course_state.dart';
import 'package:skill_zycp/data/model/course_result_model.dart';
import 'package:skill_zycp/data/repository/course_repository.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {

  CourseRepository repository;

  CourseBloc({@required this.repository});

  @override
  // TODO: implement initialState
  CourseState get initialState => CourseIntialState();

  @override
  Stream<CourseState> mapEventToState(CourseEvent event) async* {
    // TODO: implement mapEventToState
   if (event is FetchCourseEvent) {
     yield CourseLoadingState();
     try {
       Course course = await repository.getCourse();
       yield  CourseLoadedState(course: course);
     } catch (exception) {
       yield CourseErrorState(message: exception.toString());
     }
   }

  }
  
}
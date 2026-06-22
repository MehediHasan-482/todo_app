import 'package:todo_app/features/daily_rotine/presentation/pages/todo_page.dart';
import 'package:get/get.dart';

class AppPages{
  static final routes =[
    GetPage(name: '/',page:() => TodoPage()),
  ];
}
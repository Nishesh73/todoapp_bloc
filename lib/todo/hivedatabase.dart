import 'package:hive/hive.dart';

class HiveDatabase {
  //when app is first time open ever
  List todo = [];

  //reference of hive database
  var mybox = Hive.box("mybox");

  // void createInitialData(){

  //here the task name related with false or true that's why use nested list
  //  todo = [

  //   ["Suryanamaskar", false],//corrosponding bool value for checkbox
  //   //inner list contain string and bool type that's why List<dynamic>
  //   ["Yoga", false]

  // ];

  // }
  //load the hivedata, alrady exist data
  void loadData() {
    todo = mybox.get("TODOLIST");
  }

  //update on check and update on when we add new todo task
  void updateData() async {
    mybox.put("TODOLIST",
        todo); //todo list all data will be stored in mybox's TODOLIST
  }

  //  void deleteFromDatabse(int index){
  //   // mybox.delete("TODOLIST");it will delete all data
  //   //logic first delete the data from todolist, then put that inside the hive storage work
  //   //like delete

  //  }
}

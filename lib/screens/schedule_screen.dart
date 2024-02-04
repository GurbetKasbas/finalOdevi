import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:math';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  Map<DateTime, Map<String, dynamic>> _events = {}; // Her bir tarihe ait notları saklamak için kullanılan Map

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white70,

        body: Stack(
          children: [
            // Arka plan resmi
            Image.asset(
              "assets/images/woman.png", 
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  TableCalendar(
                    calendarFormat: _calendarFormat,
                    focusedDay: _focusedDay,
                    firstDay: DateTime.utc(2024, 01, 01),
                    lastDay: DateTime.utc(2025, 01, 01),
                    headerVisible: true,
                    daysOfWeekVisible: true,
                    sixWeekMonthsEnforced: true,
                    shouldFillViewport: false,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      todayDecoration: BoxDecoration(
                        color: Color(0xFFACADFF),//Color.fromRGBO(144, 32, 236, 1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color:Color.fromRGBO(144, 32, 236, 1) 
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      weekendStyle: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    eventLoader: (day) {
                      // Bu fonksiyon her bir gün için belirtilen notları döndürür
                      return _events[day] != null ? [_events[day]!] : [];
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });

                      // Seçilen güne not eklemek için burada bir diyalog 
                      _showAddNoteDialog(context);
                    },
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 30,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(172, 173, 255, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notlar',
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            SizedBox(height: 8.0),
                            _buildNoteList(), // Not listesini oluşturan özel bir metot
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildNoteList() {
    List<Widget> noteWidgets = [];
    _events.forEach((date, event) {
    final note = event['note'];
    final color = event['color'];
    final style = event['style'];


// Iconlar için bir liste
    final List<IconData> icons = [Icons.check, Icons.star, Icons.favorite, Icons.build]; 
    final randomIcon = icons[Random().nextInt(icons.length)]; // Rastgele bir ikon seç


      noteWidgets.add(
      Padding(
        padding: const EdgeInsets.all( 8.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Icon(
                randomIcon, // Rastgele seçilen ikonu kullan
                color: Colors.white,
              ),
              SizedBox(width: 8.0),
              Text(
                ' $note  :  $date ',
                style: style.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: noteWidgets,
    );
  }

  // Not eklemek için kullanılacak diyalog
  Future<void> _showAddNoteDialog(BuildContext context) async {
    String note = '';

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Not Ekle'),
          content: TextField(
            onChanged: (value) {
              note = value;
            },
            decoration: InputDecoration(
              hintText: 'Notunuzu girin',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('İptal'),
            ),
            TextButton(
              onPressed: () {
                // Notları rastgele renklerle yazdır
              final randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
              final textStyle = TextStyle(fontSize: 20, color: Colors.white);



                // Notu sakla
                _events[_selectedDay] = {'note': note, 'color': randomColor, 'style': textStyle};

                // Diyalogu kapat
                Navigator.of(context).pop();
                // State'i güncelle ve yeniden çiz
                setState(() {});
              },
              child: Text('Ekle'),
            ),
          ],
        );
      },
    );
  }
}











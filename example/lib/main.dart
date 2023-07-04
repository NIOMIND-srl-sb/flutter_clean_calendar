import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DateTime> selectedDates = [];
  List<DateTime> availableDates = [
    DateTime(2023, 07, 5),
    DateTime(2023, 07, 6),
    DateTime(2023, 07, 7),
    DateTime(2023, 07, 9),
    DateTime(2023, 07, 10),
    DateTime(2023, 07, 11),
    DateTime(2023, 07, 13),
    DateTime(2023, 07, 20),
    DateTime(2023, 07, 21),
    DateTime(2023, 07, 23),
    DateTime(2023, 07, 24),
    DateTime(2023, 07, 25),
  ];

  /// Setting startWeekday value.
  final startWeekday = WeekDay.sunday;

  /// Setting weekdaysSymbol symbols.
  final weekdaysSymbol = const Weekdays(
    monday: "L",
    tuesday: "M",
    wednesday: "M",
    thursday: "G",
    friday: "V",
    saturday: "S",
    sunday: "D",
  );

  /// Setting monthsSymbol symbols.
  final monthsSymbol = const Months(
    january: "Gennaio",
    february: "Febbraio",
    march: "Marzo",
    april: "Aprile",
    may: "Maggio",
    june: "Giugno",
    july: "Luglio",
    august: "Agosto",
    september: "Settembre",
    october: "Ottobre",
    november: "Novembre",
    december: "Dicembre",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Calendar"),
      ),
      body: Center(
        child: ListView(
          children: [
            FlutterCleanCalendar(
              enableDenseViewForDates: true,
              dateSelectionMode: DatePickerSelectionMode.singleOrMultiple,
              startWeekday: WeekDay.monday,
              weekdaysSymbol: weekdaysSymbol,
              monthsSymbol: monthsSymbol,
              selectedDates: selectedDates,
              availableDates: availableDates,
              leadingTrailingDatesProperties: DatesProperties(
                // To disable taps on leading and trailing dates.
                disable: true,
                hide: true,
                datesDecoration: DatesDecoration(
                  datesBorderRadius: 1000,
                  datesBorderColor: Colors.white,
                  datesTextColor: const Color.fromARGB(107, 158, 158, 158),
                ),
              ),
              weekdaysProperties: WeekdaysProperties(
                weekDaysContainerBackgroundColor: Colors.white,
              ),
              currentDateProperties: DatesProperties(
                datesDecoration: DatesDecoration(
                  datesBorderRadius: 1000,
                  datesBackgroundColor: Colors.transparent,
                  datesBorderColor: const Color.fromARGB(255, 22, 60, 24),
                  datesTextColor: Colors.black,
                ),
              ),
              generalDatesProperties: DatesProperties(
                datesDecoration: DatesDecoration(
                  datesBackgroundColor: Colors.transparent,
                  datesBorderRadius: 1000,
                  datesBorderColor: Colors.transparent,
                  datesTextColor: Color.fromARGB(112, 158, 158, 158),
                ),
                disable: true,
              ),
              availableDatesProperties: DatesProperties(
                datesDecoration: DatesDecoration(
                  datesBorderRadius: 1000,
                  datesBackgroundColor: Colors.transparent,
                  datesBorderColor: Colors.transparent,
                  datesTextColor: Colors.black,
                ),
                disable: false,
              ),
              selectedDatesProperties: DatesProperties(
                datesDecoration: DatesDecoration(
                  datesBorderRadius: 1000,
                  datesBackgroundColor: const Color.fromARGB(255, 22, 60, 24),
                  datesBorderColor: const Color.fromARGB(255, 22, 60, 24),
                  datesTextColor: Colors.white,
                ),
              ),
              onCalendarViewDate: (DateTime calendarViewDate) {
                // print(calendarViewDate);
              },
              onSelectedDates: (List<DateTime> value) {
                setState(() {
                  if (selectedDates.contains(value.first)) {
                    selectedDates.remove(value.first);
                  } else {
                    selectedDates.add(value.first);
                  }
                });
                // print(selectedDates);
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

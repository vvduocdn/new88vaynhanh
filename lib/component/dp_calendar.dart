import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:vaynow_flutter/component/theme.dart';
import 'package:vaynow_flutter/utils/date_extensions.dart';
import 'package:vaynow_flutter/utils/time_helper.dart';
import 'package:table_calendar/table_calendar.dart';

class DPCalendar extends StatefulWidget {
  const DPCalendar({
    super.key,
    required this.selectedDay,
    this.onDaySelected,
    this.enabledDayPredicate,
    required this.focusedDay,
  });

  final DateTime selectedDay;
  final DateTime focusedDay;
  final void Function(DateTime, DateTime)? onDaySelected;
  final bool Function(DateTime)? enabledDayPredicate;

  @override
  State<DPCalendar> createState() => _DPCalendarState();
}

class _DPCalendarState extends State<DPCalendar> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      availableGestures: AvailableGestures.none,
      firstDay: DateTime.utc(2023, 1, 1),
      lastDay: DateTime.utc(2030, 1, 1),
      focusedDay: widget.focusedDay,
      selectedDayPredicate: (DateTime day) =>
          widget.selectedDay.isSameDate(day),
      calendarFormat: CalendarFormat.month,
      locale: 'en_US',
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekHeight: 43,
      rowHeight: 43,
      daysOfWeekStyle: const DaysOfWeekStyle(
        decoration: BoxDecoration(),
        weekdayStyle: TextStyle(color: Colors.grey),
        weekendStyle: TextStyle(color: Colors.grey),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: false,
        titleTextStyle: TextStyle(color: context.colors.text),
        leftChevronVisible: false,
        rightChevronVisible: false,
      ),
      headerVisible: false,
      calendarStyle: CalendarStyle(
        // tableBorder: TableBorder.all(color: context.colors.backgroundButon),
        tablePadding: const EdgeInsets.only(bottom: 24),
        todayTextStyle: TextStyle(color: context.colors.white),
        selectedDecoration: BoxDecoration(
          color: context.colors.background,
        ),
        todayDecoration: BoxDecoration(
          color: context.colors.background,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        selectedBuilder: (BuildContext context, DateTime day, _) =>
            makeDayCell(context, day, true, false),
        todayBuilder: (BuildContext context, DateTime day, _) =>
            makeDayCell(context, day, false, false),
        defaultBuilder: (BuildContext context, DateTime day, _) =>
            makeDayCell(context, day, false, false),
        disabledBuilder: (BuildContext context, DateTime day, _) =>
            makeDayCell(context, day, false, true),
      ),
      onDaySelected: widget.onDaySelected,
      enabledDayPredicate: widget.enabledDayPredicate,
    );
  }

  Widget makeDayCell(
      BuildContext context, DateTime day, bool isFocus, bool isDisabled) {
    return DayCell(
      date: day,
      isFocus: isFocus,
      isDisabled: isDisabled,
    );
  }
}

class DayCell extends StatelessWidget {
  const DayCell({
    super.key,
    required this.date,
    required this.isFocus,
    required this.isDisabled,
  });

  final DateTime date;
  final bool isFocus;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final bool isToday = date.ymd == DateTime.now().ymd;
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: isFocus ? context.colors.h598FF9 : context.colors.white,
          border: Border.all(
              color: isFocus ? context.colors.h598FF9 : Colors.white,
              width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                DateFormat.d().format(date),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDisabled
                      ? Colors.grey
                      : isFocus
                          ? isToday
                              ? context.colors.white
                              : context.colors.white
                          : context.colors.text,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

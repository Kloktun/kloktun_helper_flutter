

class DateHelper {

  static List<String> monthsNamesRU = ["янв", "фев", "мар", "апр", "мая", "июн", "июл", "авг", "сен", "окт", "ноя", "дек"];
  static List<String> monthsFullNamesRU = ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"];

  static List<String> monthsNamesEN = ["Jun", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  static List<String> monthsFullNamesEN = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

  static String prettyDate(
    DateTime date,
    {
      bool withTime = false,
      List<String>? months
    }
  ){

    var year = date.year;
    var month = date.month - 1;
    var day = date.day;

    if(months == null){

      months = DateHelper.monthsNamesRU;

    }

    if(months.length < 12){
      throw Exception("Months sholud be contain 12 months");
    }

    var strMonth = months[month];

    if(!withTime){
      return "${day} ${strMonth} ${year}";
    }

    return "${day} ${strMonth} ${year} в ${date.hour}:${date.minute.toString().padLeft(2, "0")}";

  }

}
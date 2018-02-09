$(document).ready(function() {
  $('#calendar').fullCalendar({
    header : {
      left : 'prev,next today',
      center : 'title',
      right : 'month,basicWeek,basicDay'
    },
    editable : true,
    eventLimit : true, // allow "more" link when too many events
    events : [ /*
                 * { title : 'All Day Event', start : '2015-02-01' }, { title :
                 * 'Case 01 Deliverable', start : '2015-02-27', end :
                 * '2015-02-28' },
                 */{
      id : 999,
      title : 'Weekly Status Call',
      start : '2015-02-18T18:30:00'
    }, {
      id : 999,
      title : 'Weekly Status Call',
      start : '2015-02-25T18:30:00'
    }, /*
         * { title : 'Conference', start : '2015-02-11', end : '2015-02-13' }, {
         * title : 'Meeting', start : '2015-02-12T10:30:00', end :
         * '2015-02-12T12:30:00' }, { title : 'Lunch', start :
         * '2015-02-12T12:00:00' }, { title : 'Meeting', start :
         * '2015-02-12T14:30:00' }, { title : 'Happy Hour', start :
         * '2015-02-12T17:30:00' }, { title : 'Dinner', start :
         * '2015-02-12T20:00:00' },
         */{
      title : 'Case 01 Delivery',
      start : '2015-02-28T10:00:00'
    } /*
       * , { title : 'Click for Google', url : 'http://google.com/', start :
       * '2015-02-28' }
       */]
  });

});
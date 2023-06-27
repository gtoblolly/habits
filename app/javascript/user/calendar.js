import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import googleCalendarApi from '@fullcalendar/google-calendar'

window.addEventListener('load', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    locale: 'ja',
    dayCellContent: function(e) { e.dayNumberText = e.dayNumberText.replace('日', ''); },
    buttonText: { today: '今日', },
    plugins: [ dayGridPlugin, interactionPlugin, googleCalendarApi ],
    googleCalendarApiKey: gon.google_calender_API_key,
    eventSources: [
      {
        googleCalendarId: 'ja.japanese#holiday@group.v.calendar.google.com',
        color:"#ffd0d0",
        display: 'background'
      },
      {
        url: `/users/${gon.user.id}.json`,
        color: 'green',
        display: 'background'
      },
    ],
    eventClick: function(info) {
      window.location.href = `/habits/${info.event.extendedProps.habit_id}/records/date?date=${info.event.startStr}&user_id=${gon.user.id}`;
    },
  });

  calendar.render();
});
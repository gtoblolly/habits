import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import googleCalendarApi from '@fullcalendar/google-calendar'

document.addEventListener('turbolinks:load', function() {
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
        url: '/habits.json',
        color: 'green',
        display: 'background'
      },
    ],
  });

  calendar.render();
});
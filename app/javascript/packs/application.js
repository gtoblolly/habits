// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
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
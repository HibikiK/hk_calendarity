import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('turbolinks:load', function() {
  let calendarEl = document.getElementById('my_calendar');

  let calendar = new Calendar(calendarEl, {
    // events: "/users/1.json",
    plugins: [ dayGridPlugin, interactionPlugin ]
  });

  calendar.render();
});
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('turbolinks:load', function() {
  let calendarEl = document.getElementById('group_calendar');

  let calendar = new Calendar(calendarEl, {
    events: '/events.json',
    plugins: [ dayGridPlugin, interactionPlugin ]
  });

  calendar.render();
});
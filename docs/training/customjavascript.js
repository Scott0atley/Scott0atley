
// JavaScript to start timer when the user opens the app
var startTime;
$(document).on('shiny:connected', function() {
  startTime = new Date().getTime();  // Capture the current time when the app is opened
});

// JavaScript function to calculate elapsed time on submit
function getElapsedTime() {
  var endTime = new Date().getTime();
  var timeSpent = (endTime - startTime) / 1000;  // Time in seconds
  Shiny.setInputValue('time_spent', timeSpent);  // Send to Shiny input
}
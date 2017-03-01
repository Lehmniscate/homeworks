console.log("Hello from the JavaScript console!");

// Your AJAX request here
// http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b

var weather = "";

var weatherCallBack = function(widgetData) {
  weather = widgetData;
  console.log(weather);
}

$.ajax({
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b",
  type: "GET",
  success: weatherCallBack,
  error: (error) => console.log("uh oh, something went wrong...")
})

// Add another console log here, outside your AJAX request
console.log("End of weather ajax file");

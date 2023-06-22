// Slide Index
var slideIndex = 0;
showSlides();

function showSlides() {
  var slides = document.getElementsByClassName("carousel_item");
  
  // Hide all slides
  for (var i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  
  // Increment slideIndex and reset if out of bounds
  slideIndex++;
  if (slideIndex > slides.length) {
    slideIndex = 1;
  }
  
  // Display current slide
  slides[slideIndex - 1].style.display = "block";
  
  // Delay before showing next slide (in milliseconds)
  var delay = 2000;
  
  // Repeat the function after the delay
  setTimeout(showSlides, delay);
}
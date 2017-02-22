// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//  require turbolinks
//= require_tree .

// Start-- JavaScript function to count down the characters in textarea of tweet and also disallows it write beyond 140
$(document).ready(function(){
   $('#ta').on('keydown paste',countDown);
});

function count_down() {
  element = document.getElementById('ta');
  element2 = document.getElementById('count1')
  element2.innerHTML = 140 - element.value.length;
  var btn = document.getElementById("submit-btn");

  if (element2.innerHTML < 0) {
      element2.style.color = 'red';
      btn.disabled = true
      $( "#submit-btn" ).removeClass( "btn-primary" );
    }
    else {
      $( "#submit-btn" ).addClass( "btn-primary" );
      element.style.color = 'grey';
      btn.disabled = false;
    }
}
// End--

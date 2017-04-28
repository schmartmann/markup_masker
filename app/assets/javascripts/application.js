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
//= require turbolinks
// = require_tree .
$(document).ready(function(){

  const html = $(".code");
  const rowNumber = $(".row-number");
  const htmlShow = $("#html_show");
  const htmlHide = $("#html_hidden");
  const rowShow = $("#row_show");
  const rowHide = $("#row_hidden"); 

  const hideElement = (name) => {
    if (name === "html"){
      console.log("hiding html");
      html.hide()
    } else {
      rowNumber.hide()
    }
  }

  const showElement = (name) => {
    if (name === "html"){
      html.show()
    } else {
      rowNumber.show()
    }
  }

  const valCheck = (target) => {
    if (target.value === "show") {
      showElement(target.name);
    } else {
      hideElement(target.name);
    }
  }

  const clickHandler = (target) => {
    valCheck(target);
  }

  htmlShow.click(function(){
    clickHandler(event.target);
  });
  htmlHide.click(function(){
    clickHandler(event.target);
  });
  rowShow.click(function(){
    clickHandler(event.target);
  });
  rowHide.click(function(){
    clickHandler(event.target);
  }); 


});

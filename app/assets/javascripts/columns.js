var ready = function () {

  var html = $(".code");
  var rowNumber = $(".row-number");
  var htmlShow = $("#html_show");
  var htmlHide = $("#html_hidden");
  var rowShow = $("#row_show");
  var rowHide = $("#row_hidden"); 

  var hideElement = (name) => {
    if (name === "html"){
      html.hide()
    } else {
      rowNumber.hide()
    }
  }

  var showElement = (name) => {
    if (name === "html"){
      html.show()
    } else {
      rowNumber.show()
    }
  }

  var valCheck = (target) => {
    if (target.value === "show") {
      showElement(target.name);
    } else {
      hideElement(target.name);
    }
  }

  var clickHandler = (target) => {
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

};

$(document).ready(ready);
$(document).on("turbolinks:load", ready);

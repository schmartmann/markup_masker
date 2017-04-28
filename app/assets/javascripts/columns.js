$(document).ready(function(){
  console.log("hacked"); 

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

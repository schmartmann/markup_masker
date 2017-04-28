var ready = () => {

  var form = $("form"); 

  var loader = () =>{
    if (form.children().length < 5) {
      form.append("<h6>Uploading file...</h6>");
    }
  };

  form.submit(loader);

}

$(document).ready(ready); 
$(document).on("turbolinks:load", ready); 


$(document).ready(function() {
  $("a.delete").click(function(){
    $.ajax({
      type: "DELETE",
      url: this.href
    });
    $(this).parents("p:first").remove();
    return false;
  });
});

$(document).ready(function() {
  $("a.delete").click(function(){
    $.ajax({
      type: "DELETE",
      url: this.href
    });
    $(this).prevAll("input[type=hidden]").val("1");
    $(this).parents("p:first").hide();
    return false;
  });
});

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  var changePlayer = function() {
    var $playerFields = $('.player-fields');
    $.each($playerFields, function(k, v) {
      console.log(k);
      console.log(v);

      var $playerIdSelect = $(v).find('.form-group.select .form-control');
      $playerIdSelect.on('change', function(){
        var $this = $(this);

        if(!$this.val()) {
          $(v).find(" .form-control").val("");
          $(v).find(" .form-control").removeAttr("readonly");
        } else {
          $.ajax({
            "url": '/player/bases/' + $this.val() + '.json'
          }).success(function(data){
            $.each(data, function(index, value){
              if (index !== "id") {
                $(v).find("[class$='_" + index + "'] .form-control").val(value);
                $(v).find("[class$='_" + index + "'] .form-control").attr("readonly", "readonly")
              }
            });
          })
        }
      });
    });
  };

  changePlayer();
  $('form').on('cocoon:after-insert', function(e, insertedItem) {
    changePlayer();
  });
})

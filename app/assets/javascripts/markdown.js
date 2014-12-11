$(document).on("page:change", function() {
  controller = new Controller
  controller.bindListeners()
})

function Controller() {

}

Controller.prototype = {
  bindListeners: function(){
    $('#question_content').on('keyup', this.getNewHtml)
  },
  getNewHtml: function(){
    newHtml = ""
    var lines = $('#question_content').val().split("\n")
    for(var i = 0; i < lines.length; i++){
      for(var headingIndex = 1; headingIndex <=6; headingIndex++){
        var re = new RegExp('^#{' + headingIndex + '}((\\w|\\s)+)$');
        if (lines[i].match(re)) {
          newHtml += "<h"+headingIndex+">" + lines[i].match(re)[1] + "</h"+headingIndex+">"
        }
      }

    }
    $('#markdown').html(newHtml)
  }
}

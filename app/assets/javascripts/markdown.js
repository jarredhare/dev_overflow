$(document).on("page:change", function() {
  controller = new Controller
  controller.bindListeners()
})

function Controller() {
}

Controller.prototype = {
  bindListeners: function(){
    $('#question_content').on('keyup', this.getNewHtml.bind(this))
  },

  getNewHtml: function(){
    newHtml = ""
    var lines = $('#question_content').val().split("\n")
    for(var index = 0; index < lines.length; index++){
      if (lines[index].match(/^#.*/))  {                    //getting headlines
        newHtml += this.getHeadings(lines[index])
      } else if (lines[index].match(/^!\[.*]\((.+)\)$/)) {  //getting images
        newHtml += this.getImage(lines[index])
      } else if (lines[index].match(/^\[(.*)]\((.+)\)$/)) {
        newHtml += this.getLink(lines[index])
      } else {
        newHtml += lines[index]
      }
    }
    $('#markdown').html(newHtml)
  },

  getHeadings: function(line) {
    headingHtml = ""
    for(var headingIndex = 1; headingIndex <=6; headingIndex++){
      var re = new RegExp('^#{' + headingIndex + '}((\\w|\\s)+)$');
      if (line.match(re)) {
        headingHtml += "<h"+headingIndex+">" + line.match(re)[1] + "</h"+headingIndex+">"
      }
    }
    return headingHtml
  },

  getImage: function(line) {
    return "<img src=" + line.match(/^!\[.*]\((.+)\)$/)[1] + "/>"
  },

  getLink: function(line) {
    return "<a href=" + line.match(/^\[(.*)]\((.+)\)$/)[2] + ">" + line.match(/^\[(.*)]\((.+)\)$/)[1] + "</a>"
  }
}



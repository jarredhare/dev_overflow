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

  getNewHtml: function(lines){
    newHtml = ""
    var lines = $('#question_content').val().split("\n")
    for(var index = 0; index < lines.length; index++){
      if (lines[index].match(/^#.*/))  {                    //getting headlines
        newHtml += this.getHeadings(lines[index])
      } else if (lines[index].match(/^!\[.*]\((.+)\)$/)) {  //getting images
        newHtml += this.getImage(lines[index])
      } else if (lines[index].match(/^\[(.*)]\((.+)\)$/)) {
        newHtml += this.getLink(lines[index])
      } else if (lines[index].match(/^[\*|\-|+](.+)$/)) {
        newHtml += this.getList(lines[index])
      } else if (lines[index].match(/^`(.+)`$/)) {
        newHtml += this.getCode(lines[index]) + "<br>"
      } else {
        newHtml += lines[index] + "<br>"
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
    var href = line.match(/^\[(.*)]\((.+)\)$/)[2]
    var title = line.match(/^\[(.*)]\((.+)\)$/)[1]
    return "<a href=" + href + ">" + title + "</a>"
  },

  getList: function(line) {
    return "<li>" + line.match(/^[\*|\-|+](.+)$/)[1] + "</li>"
  },

  getCode: function(line) {
    return "<code>" + line.match(/^`(.+)`$/)[1] + "</code>"
  }
}



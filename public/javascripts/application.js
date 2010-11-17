Word = Backbone.Model.extend({

  validate: function(attrs) {
    if (!attrs.content.length) {
      return "content can't be blank";
    }
  },

  getContent: function() {
    return this.get("content");
  }
                               
});

word = new Word({
  content : "especially"
});

word.bind("error", function(model, error) {
  alert(error);
});

WordView = Backbone.View.extend({

  initialize: function() {
    _(this).bindAll("render");
    this.model.bind("change", this.render);
  },

  render: function() {
    $(this.el).html(this.model.get("content"));
    return this;
  }

});

new WordView({
    model: word,
    el: $('#words')
}).render();

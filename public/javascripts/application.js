Word = Backbone.Model.extend({
});

word = new Word({
  content: "indubitably"
});

WordView = Backbone.View.extend({

  events: {
    "change #change-word": "changeWord"
  },

  changeWord: function() {
    this.model.set({content: $('#change-word').val()})
    $('#change-word').val('');
  },

  initialize: function() {
    _(this).bindAll("render");
    this.model.bind("change", this.render);
  },

  render: function() {
    $('#word', this.el).html(this.model.get("content"));
    return this;
  }

});

wordView = new WordView({
  model: word,
  el: $('body')
})

wordView.render();

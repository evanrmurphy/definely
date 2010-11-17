Word = Backbone.Model.extend({
});

word = new Word({
  content: "indubitably"
});

WordView = Backbone.View.extend({

  initialize: function() {
    _(this).bindAll("render");
    this.model.bind("change", this.render);
  },

  render: function() {
    $(this.el).append('<li>' + this.model.get("content"));
    return this;
  }

});

AppView = Backbone.View.extend({

  events: {
    "change #new-word": "addWord"
  },

  addWord: function() {
    new WordView({
      model: new Word({content: $('#new-word').val()}),
      el: $('#words')
    }).render();

    $('#new-word').val('');
  }

});

appView = new AppView({
  el: $('body')
});

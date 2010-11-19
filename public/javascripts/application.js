/* Models */

Word = Backbone.Model;

/* Collections */

WordCollection = Backbone.Collection.extend({
  model: Word,

  comparator: function(word) {
    return word.get("content");
  }
});

words = new WordCollection;

words.bind("add", function(word) {

  $('#words').empty();

  words.each(function(word) {
    $('#words').append(
      new WordView({
        model: word
      }).render().el
    );
  });
});

/* Views */

WordView = Backbone.View.extend({

  tagName: "li",

  className: "word",

  initialize: function() {
    _(this).bindAll("render");
    this.model.bind("change", this.render);
  },

  render: function() {
    $(this.el).html("<" + this.tagName + " class=\"" + this.className + "\">" + this.model.get("content"));
    return this;
  }
});

AppView = Backbone.View.extend({

  events: {
    "change #new-word": "addWord"
  },

  addWord: function() {

    words.add(new Word({
      content: $('#new-word').val()
    }));

    $('#new-word').val('');
  }
});

appView = new AppView({
  el: $('body')
});

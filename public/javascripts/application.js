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

  events: {
    "dblclick": "edit"
  },

  edit: function() {
    $(this.el).html(
      this.make("input",
                {className: "editing",
                 value: this.model.get("content")}));
  },

  initialize: function() {
    _(this).bindAll("render");
    this.model.bind("change", this.render);
  },

  // render: function() {
  //   $(this.el).html(
  //     this.make(this.tagName,
  //               {className: this.className},
  //               this.model.get("content")));
  //   return this;
  // },

  render: function() {
    $(this.el).html(
      _.template($('#word-template').html(),
                 {content: this.model.get("content")}));
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

/* Models */

Word = Backbone.Model;

/* Collections */

WordCollection = Backbone.Collection.extend({
  model: Word,

  comparator: function(word) {
    return word.get("content");
  }
});

/* Views */

WordView = Backbone.View.extend({

  tagName: "li",

  className: "word",

  events: {
    "dblclick .show .content": "edit",
    "change .edit input": "update",
    "blur   .edit input": "update",
  },

  edit: function() {
    this.$('.edit input').val( this.model.get("content") );
    this.$('.show, .edit').toggle();
    this.$('.edit input').select();
  },

  update: function() {
    this.model.set({
        content: this.$('.edit input').val()
    });
    this.model.change(); // in case the update doesn't change the value
  },

  initialize: function() {
    _(this).bindAll("render");
    this.model.bind("change", this.render);
  },

  render: function() {
    $(this.el).html(
      _.template( $('#word-template').html() )
    );
    this.$('.show .content').html( this.model.get("content") );
    return this;
  }
});

WordsView = Backbone.View.extend({

  events: {
    "change .new input": "addWord"
  },

  addWord: function() {

    this.collection.add(new Word({
      content: this.$('.new input').val()
    }));

    this.$('.new input').val('');
  },

  render: function() {
    $(this.el).html(
      _.template( $('#words-template').html() )
    );
    return this;
  }
});

words = new WordCollection;

wordsView = new WordsView({
  collection: words
});

wordsView.collection.bind("add", function(word) {

  wordsView.$('.words').empty();

  wordsView.collection.each(function(word) {
    wordsView.$('.words').append(
      new WordView({
        model: word
      }).render().el
    );
  });
});

$('body').append(
  wordsView.render().el
);

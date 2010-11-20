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
    "dblclick": "edit",
    "keypress input": "updateOnEnter",
  },

  edit: function() {
    this.$('.edit input').val( this.model.get("content") );
    this.$('.show, .edit').toggle();
    this.$('.edit input').select();
  },

  /* Would it be more robust to use form submit or blur? */

  updateOnEnter: function(e) {
    if (e.keyCode == 13) {
      this.model.set({
          content: this.$('.edit input').val()
      });
      this.model.change(); // in case the update doesn't change the value
    }
  },

  initialize: function() {
    _(this).bindAll("render");
    this.model.bind("change", this.render);
  },

  render: function() {
    $(this.el).html(
      _.template( $('#word-template').html() )
    );
    this.$('.show').html( this.model.get("content") );
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

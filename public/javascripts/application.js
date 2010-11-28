(function() {
  var Word, WordCollection, WordView, WordsView, words, wordsView;
  Word = Backbone.Model;
  WordCollection = Backbone.Collection.extend({
    model: Word,
    comparator: function(word) {
      return word.get("content");
    }
  });
  WordView = Backbone.View.extend({
    tagName: "li",
    className: "word",
    events: {
      "mouseover": "toggleDestroy",
      "mouseout": "toggleDestroy",
      "dblclick": "edit",
      "click .show .destroy": "destroy",
      "change .edit input": "update",
      "blur   .edit input": "update"
    },
    toggleDestroy: function() {
      return this.$('.show .destroy').toggle();
    },
    edit: function() {
      this.$('.edit input').val(this.model.get("content"));
      this.$('.show, .edit').toggle();
      return this.$('.edit input').focus();
    },
    update: function() {
      this.model.set({
        content: this.$('.edit input').val()
      });
      return this.model.change();
    },
    destroy: function() {
      this.collection.remove(this.model);
      delete this.model;
      return this.remove();
    },
    initialize: function() {
      _(this).bindAll("render");
      return this.model.bind("change", this.render);
    },
    render: function() {
      $(this.el).html(_.template($('#word-template').html()));
      this.$('.show .content').html(this.model.get("content"));
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
      return this.$('.new input').val('');
    },
    render: function() {
      $(this.el).html(_.template($('#words-template').html()));
      return this;
    }
  });
  words = new WordCollection;
  wordsView = new WordsView({
    collection: words
  });
  wordsView.collection.bind("add", function(word) {
    wordsView.$('.words').empty();
    return wordsView.collection.each(function(word) {
      return wordsView.$('.words').append(new WordView({
        model: word,
        collection: words
      }).render().el);
    });
  });
  $('body').append(wordsView.render().el);
}).call(this);

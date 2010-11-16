AppView = Backbone.View.extend({

    el: $('#dictionaryapp'),

    events: {
      "keypress #new-word": "createOnEnter",
      "keypress #new-definition": "createOnEnter"
    },

    initialize: function() {
      _.bindAll(this, 'addOne', 'addAll', 'render');

      this.input    = this.$("#new-entry");

      Entries.bind('add',     this.addOne);
      Entries.bind('refresh', this.addAll);
      Entries.bind('all',     this.render);
    },

    addOne: function(entry) {
      var view = new EntryView({model: entry});
      this.$("#entry-list").append(view.render().el);
    },

    addAll: function() {
      Entries.each(this.addOne);
    },

    newAttributes: function() {
      return {
        word: this.wordInput.val(),
        definition: this.definitionInput.val()
      };
    },

    createOnEnter: function(e) {
      if (e.keyCode != 13) return;
      Entries.create(this.newAttributes());
      this.wordInput.val('');
      this.definitionInput.val('');
    }
    
});

App = new AppView;

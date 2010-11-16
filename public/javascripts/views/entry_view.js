EntryView = Backbone.View.extend({

  tagName: "li",

  template: _.template($('#entry-template').html()),

  events: {
    "dblclick .entry-word"       : "editWord",
    "dblclick .entry-definition" : "editDefinition",
    "click .entry-destroy"       : "clear",
    "keypress .entry-input"       : "updateOnEnter"
  },

  render: function() {
    $(this.el).html(this.template(this.model.toJSON()));
    this.setWord();
    this.setDefinition();
    return this;
  },

  setWord: function(){
    var word = this.model.get('word');
    this.$('.entry-word').text(word);
    this.wordInput = this.$('.entry-word-input');
    this.wordInput.bind('blur', this.close);
    this.wordInput.val(content);
  },

  setDefinition: function(){
    var definition = this.model.get('definition');
    this.$('.entry-definition').text(definition);
    this.definitionInput = this.$('.entry-definition-input');
    this.definitionInput.bind('blur', this.close);
    this.definitionInput.val(content);
  },

  editWord: function() {
    $(this.el).addClass("editing");
    this.wordInput.focus();
  },

  editDefinition: function() {
    $(this.el).addClass("editing");
    this.definitionInput.focus();
  },

  close: function() {
    $(this.el).removeClass("editing");
  },

  updateOnEnter: function() {
    if (e.keyCode == 13) this.close();
  },

  remove: function() {
    $(this.el).remove();
  },

  clear: function() {
    this.model.clear();
  }

});

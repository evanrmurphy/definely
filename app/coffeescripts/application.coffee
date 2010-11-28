# Models

Word = Backbone.Model

# Collections

WordCollection = Backbone.Collection.extend
  model: Word
  comparator: (word) ->
    word.get "content"

# Views

WordView = Backbone.View.extend
  tagName: "li"
  className: "word"
  events:
    "mouseover": "toggleDestroy"
    "mouseout": "toggleDestroy"
    "dblclick": "edit"
    "click .show .destroy": "destroy"
    "change .edit input": "update"
    "blur   .edit input": "update"
  toggleDestroy: ->
    this.$('.show .destroy').toggle()

  edit: ->
    this.$('.edit input').val this.model.get "content"
    this.$('.show, .edit').toggle()
    this.$('.edit input').focus()  # alternatively, use .select() to highlight the text

  update: ->
    this.model.set
      content: this.$('.edit input').val()
    this.model.change() # in case the update doesn't change the value

  destroy: ->
    this.collection.remove this.model
    delete this.model
    this.remove()

  initialize: ->
    _(this).bindAll "render"
    this.model.bind "change", this.render

  render: ->
    $(this.el).html _.template $('#word-template').html()
    this.$('.show .content').html this.model.get "content"
    this

WordsView = Backbone.View.extend
  events:
    "change .new input": "addWord"
  addWord: ->
    this.collection.add new Word
      content: this.$('.new input').val()
    this.$('.new input').val ''
  render: ->
    $(this.el).html _.template $('#words-template').html()
    this

words = new WordCollection

wordsView = new WordsView
  collection: words

wordsView.collection.bind "add", (word) ->
  wordsView.$('.words').empty()
  wordsView.collection.each (word) ->
    wordsView.$('.words').append(new WordView
                                   model: word
                                   collection: words
                                 .render().el)

$('body').append wordsView.render().el

WordView = Backbone.View.extend({

  events: {
    "keypress #new-word": "alertOnEnter",
  },

  alertOnEnter: function() {
    alert('You pressed enter')
  },

  render: function() {
    return this;
  }

});

View = new WordView();

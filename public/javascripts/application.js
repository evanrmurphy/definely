word = new Backbone.Model({content : "especially"});

WordView = Backbone.View.extend({

  initialize: function() {
    _.bindAll(this, "render");
    this.model.bind("change", this.render);
  },

  render: function() {
    $('#words').html(this.model.get("content"));
    return this;
  }

});

wordView = new WordView({model: word});

wordView.render();

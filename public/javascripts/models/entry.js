Entry = Backbone.Model.extend({

  clear: function() {
    this.destroy();
    this.view.remove();
  }

});

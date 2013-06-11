$(function(){
    var Event = Backbone.Model.extend();
    
    var Events = Backbone.Collection.extend({
        model: Event,
        url: 'events'
    });
    
    var EventsView = Backbone.View.extend({
        initialize: function(){
            _.bindAll(this);
	    
            this.collection.bind('reset', this.addAll);
        },
        render: function() {
            this.$el.fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,basicWeek,basicDay',
                    ignoreTimezone: false
                },
                selectable: true,
                selectHelper: true,
                editable: true,
		select: this.select
            });
        },
	select: function(startDate, endDate) {
            var eventView = new EventView();
            eventView.collection = this.collection;
            eventView.model = new Event({start: startDate, end: endDate});
            eventView.render();
	},
        addAll: function(){
            this.$el.fullCalendar('addEventSource', this.collection.toJSON());
        }
    });

    var EventView = Backbone.View.extend({
	el: $('#eventDialog'),
	initialize: function() {
            _.bindAll(this);
	},
	render: function() {
            this.$el.dialog({
		modal: true,
		title: 'New Event',
		buttons: {'Ok': this.save, 'Cancel': this.close}
            });
	    
            return this;
	},
	save: function() {
            this.model.set({'title': this.$('#title').val(), 'color': this.$('#color').val()});
            this.collection.create(this.model, {success: this.close});
        },
	close: function() {
            this.$el.dialog('close');
	}
    });
    var events = new Events();
    new EventsView({el: $("#calendar"), collection: events}).render();
    events.fetch();
});

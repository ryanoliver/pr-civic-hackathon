$(document).ready(function() {
    
    
    /* initialize the external events
       -----------------------------------------------------------------*/
    
    var gid = 1; // event.id == 0 considered to be undefined (boo) 
    var dragged = null;
    $('#external-events div.external-event').each(function() {
        var eventObject = {
            title: $.trim($(this).text()), // use the element's text as the event title
            id: gid ++
        };
        
        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);
        
        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
        });
    });
    
    $('#external-events').droppable({
        drop: function( event, ui ) {
            if ( dragged && ui.helper && ui.helper[0] === dragged[0] ) {
                var event = dragged[1];
                //$('#calendar').fullCalendar('removeEvent',id );
                calendar.fullCalendar('removeEvents',event.id);
                var el = $( "<div class='external-event'>" ).appendTo( this ).text( event.title );
                el.draggable({
                    zIndex: 999,
                    revert: true,      // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag
                });
                el.data('eventObject', { title: event.title, id :event.id });
            }
        }
    });
    
    
    /* initialize the calendar
       -----------------------------------------------------------------*/
    
    var calendar = $('#calendar').fullCalendar({
        header: {
            left: '',
            center: 'title',
            right: ''
        },
        editable: true,
        defaultView: 'agendaWeek',
        columnFormat: { week: 'dddd' },
        droppable: true, 
        events: gon.events,
        titleFormat: { week: 'yyyy'},
        drop: function(date, allDay) { // this function is called when something is dropped
            
            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data('eventObject');
            
            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);
            
            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;
            
            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
            
            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }
        },
        eventDragStart: function( event, jsEvent, ui, view ) { 
            dragged = [ ui.helper[0], event ];
        }
        //  eventRender: function(event, element, view){
        //   element.qtip({ content: "event3"});
        // }
    });
});

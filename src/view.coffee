
class Clock
    constructor: (@el, @timezone, @title) ->
    # creates a clock where @timezone is the UTC offset for
    # the given timezone
    
    render: ->
        $(@el).append template.clock(@title)
        @tick()
        
    tick: ->
        x = render_time(@timezone)
        self = @
        days = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
        months = ["Jan","Feb","Mar","Apr","May","Jun",
                  "Jul","Aug","Sep","Oct","Nov","Dec"]
        $("##{@title}-clock").html (
            "<p>#{days[x.day]}, #{catZero(x.hours)}:#{catZero(x.minutes)}:
            #{catZero(x.seconds)} #{x.diem}, <br /> 
            #{months[x.month]} #{catZero(x.date)}, #{x.year}</p>"
            )
        window.setTimeout((-> self.tick()), 1000)
        
class Sidebar
    constructor: (@el) ->
    
    render: ->
        for state in states
            clock = new Clock(@el, state.offset, state.state)
            $(@el).append clock.render()
            
bar = new Sidebar("#app")
bar.render()
# clock = new Clock("#app", -11, "American_Samoa")
# clock.render()
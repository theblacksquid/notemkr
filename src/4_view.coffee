
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
        clocks = []
        for state in states
            clocks.push new Clock(@el, state.offset, state.state)
        for clock in clocks
            clock.render()
            
class Main
    constructor: (@el) ->
    
    render: ->
        $(@el).append template.callInfo()   
        $(@el).append template.cxInfo()
        $(@el).append template.notes()
        $(@el).append template.diagResults()
        $(@el).append template.conclusions()
        @checkEnable("#va_done","#va_rad1")
        @checkEnable("#va_done","#va_rad2")
        @checkEnable("#warranty","#warranty_rad1")
        @checkEnable("#warranty","#warranty_rad2")
        @checkEnable("#toade","#toade_date")
        @checkEnable("#heatcheck","#hc_rad1")
        @checkEnable("#heatcheck","#hc_rad2")
        @checkEnable("#heatcheck","#hc_rad2")
        @checkEnable("#resolved","#reso_rad1")
        @checkEnable("#resolved","#reso_rad2")
    
    checkEnable: (elem, target) ->
        $(elem).change(->
            if $(elem).prop('checked') is true
                $(target).prop('disabled', false)
            else
                $(target).prop('disabled', true)
            )
            

class App
    constructor: (@el) ->
    
    render: ->
        main = new Main("#main")
        sidebar = new Sidebar("#clocks-many")
        main_clocks = [
            new Clock("#clocks-main", 8, "Manila")
            new Clock("#clocks-main", -5, "Eastern")
            new Clock("#clocks-main", -6, "Central")
            new Clock("#clocks-main", -7, "Mountain")
            new Clock("#clocks-main", -8, "Pacific")
            ]
        $(@el).html template.main()
        for clock in main_clocks
            clock.render()
        sidebar.render()
        main.render()


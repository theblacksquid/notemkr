
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
        $("#header").append template.menu()
        $(@el).append template.callInfo()   
        $(@el).append template.cxInfo()
        $(@el).append template.notes()
        $(@el).append template.conclusions()
        $(@el).append template.diagResults()
        $(@el).append template.dispatchNotes()
        $(@el).append template.buttons()
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
        @checkEnable("#tat", "#tat_val")
        @checkEnable("#adv_data_loss", "#adv_data_loss_val")
    
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
        all_ids = template.callInfo.ids.concat(
            template.cxInfo.ids
            template.notes.ids
            template.diagResults.ids
            template.conclusions.ids
            )
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
        @getField('#conclusions', "#conclusions_btn")
        @getValues(all_ids, '#ts_steps_btn')
        @getField('#agent_desc', '#agent_desc_btn')
        @getField('#symptoms', '#symptoms_btn')
    
    getValues: (section, button) ->
        $(button).click(->
            result = extract_values((->
                if getType(section) is '[object Function]'
                    section.ids
                else if getType(section) is '[object Array]'
                    section
                )())
            
            clipboard.copy(template.note(result))
            console.log result
            console.log template.note(result)
            )
    getField: (field, button) ->
        $(button).click(->
            $(field).select()
            document.execCommand('copy')
            )
    


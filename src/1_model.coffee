
catZero = (val) ->
    if val < 10
        '0'+val
    else val

render_time = (time_offset) ->
    current_time = new Date()
    am_pm = "AM"
    #tzOffset = current_time.getTimezoneOffset()/60
    current_time.setHours(current_time.getUTCHours() + time_offset)
    h = current_time.getHours()
    
    if h is 0
        h = 12
        
    if h > 12
        h = h - 12
        am_pm = "PM"

    result = {
        day : current_time.getDay()
        hours : h
        minutes : current_time.getMinutes()
        seconds : current_time.getSeconds()
        diem: am_pm
        date : current_time.getDate()
        month : current_time.getMonth()
        year : current_time.getFullYear()
    }

extract_values = (id_list) ->
    result = {}
    for id in id_list
        target = '#'+id
        if $(target).is('input:text') or $(target).is('textarea')
            result[id] = $(target).val()
        if $(target).is('input:checkbox')
            result[id] = $(target).prop('checked')
        if $(target).is("input[type='radio']:checked")
            result[id] = $(target).val()
        if $(target).is('select')
            result[id] = $(target+' option:selected').text()
    result

clear_values = (id_list) ->
    for id in id_list
        target = '#'+id
        if $(target).is('input:text') or $(target).is('textarea')
            $(target).val('')
        if $(target).is('input:checkbox')
            $(target).prop('checked', false)
        if $(target).is("input[type='radio']:checked")
            $(target).prop('checked', false)
        if $(target).is('select')
            $(target).prop('selectedIndex', 0)
            
load_values = (id_list, input) ->
    for id in id_list
        target = '#'+id
        if $(target).is('input:text') or $(target).is('textarea')
            $(target).val(input[id])
        if $(target).is('input:checkbox')
            $(target).prop('checked', input[id])
        if $(target).is("input[type='radio']")
            $(target).prop('checked', input[id])
        if $(target).is('select')
            $(target).prop('selectedIndex', input[id])

getType = (obj) ->
    if obj is null
        '[object Null]'
    else 
        Object.prototype.toString.call(obj)
        
isBlank = (obj) ->
    if obj is ''
        'N/A'
    else 'yes'
    
checkboxHandler = (checkbox, rad1, rad2) ->
    if checkbox is true
        rad1 or rad2
    else 'n/a'

isChecked = (input) ->
    if input is true
        'Yes'
    else 'No'

days = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]

months = ["Jan","Feb","Mar","Apr","May","Jun",
          "Jul","Aug","Sep","Oct","Nov","Dec"]

arr_eq = (arr1, arr2) ->
    i = 0
    if arr1.length isnt arr2.length
        return false
    else
        while arr1.length > i
            if arr1[i] isnt arr2[i]
                return false
    true




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
    result

getType = (obj) ->
    if obj is null
        '[object Null]'
    else 
        Object.prototype.toString.call(obj)

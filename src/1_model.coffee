
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



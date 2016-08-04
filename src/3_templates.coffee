
main_sz = 'w3-rest'
side_col = 'w3-quarter'
field_style = "style='width:32%;'"
menu_style = "style='display:inline-block;background-color:transparent'"

template = {}

template.menu = ->
    """
    <div class='w3-container #{main_sz} w3-btn-bar w3-show-inline-block w3-text-white' #{menu_style}>
        <button class='w3-btn w3-ripple' id='new_note'>New</button>
        <button class='w3-btn w3-ripple' id='save_note'>Save</button>
        <button class='w3-btn w3-ripple' id='view_all_notes'>View Notes</button>
        <button class='w3-btn w3-ripple' id='more_options'>More</button>
    </div>
    """
    
template.menu.ids = [
    'new_note'
    'save_note'
    'view_all_notes'
    'more_options'
    ]

template.main = ->
    """
    <div id='header' class='w3-container w3-row' style='background-color:steelblue;'>
      <!---  <div class='w3-container'><img src='img/dell_icon.png.ico'></div> --->
       <!--- <div class='w3-container' style='display:inline-block'>
            <h2>NOTEMKR</h2>
        </div> --->
    </div>
    <div class='w3-container w3-row' style='background-color: steelblue'>
        <div id='sidebar' class='w3-container #{side_col}' style='font-size: xx-small; font-weight: bold'>
            <div class='w3-container'></div>
            <div id='clocks-main' class='w3-container' style='height: 50vh; overflow: auto'></div>
            <div class='w3-border w3-center'>
            ----------
            </div>
            <div id='clocks-many' class='w3-container' style='height: 40vh; overflow: auto'></div>
        </div>
        
        <div id='main' class='w3-container w3-text-white' style='font-size:small;height:90vh;overflow:auto'></div>
    </div>
    """

template.clock = (title) ->
    """
    <div class='w3-container w3-border w3-black'>
        <div id='#{title}-clock'></div>
        <div>#{title}</div> 
    </div>
    """
    
template.callInfo = ->
    """
    <div class='w3-container w3-border #{main_sz}'>
        <input type='text' id='bttr' placeholder='BTTR' #{field_style}>
        <input type='text' id='ptr_id' placeholder='PTR/OKB ID' #{field_style}>
        <input type='text' id='svc_tag' placeholder='Service Tag' #{field_style}> <br />
        <input type='checkbox' id='dps_case'> Dispatch Case? 
    </div>
    """
template.callInfo.ids = [
    'bttr'
    'ptr_id'
    'svc_tag'
    'dps_case'
    ]

template.cxInfo = ->
    """
    <div class='w3-container w3-border #{main_sz}'>
        <input type='text' id='caller_name' placeholder='Caller&#39;s Name' #{field_style}>
        <input type='text' id='ppn' placeholder='Primary Phone #' #{field_style}> 
        <input type='text' id='apn' placeholder='Alternate Phone #' #{field_style}> 
        <br />
        <input type='text' id='email' placeholder='Email Address' #{field_style}>
        <br />
        <input type='checkbox' id='va_done'> Verify Authorization
        <input type='radio' id='va_rad1' name='va_result' value='Passed' disabled> Passed
        <input type='radio' id='va_rad2' name='va_result' value='Failed' disabled> Failed
        <br />
        <input type='checkbox' id='toade'> Told About Date of Warranty Expiration?
        <input type='text' id='toade_date' placeholder='Warranty End Date' disabled>
        <br />
        <input type='checkbox' id='warranty'> Educated About Warranty? 
        <input type='radio' id='warranty_rad1' name='warrany_type' value='Onsite' disabled> Onsite
        <input type='radio' id='warranty_rad2' name='warrany_type' value='Mail-In' disabled> Mail-In
    </div>
    """
template.cxInfo.ids = [
    'caller_name'
    'ppn'
    'apn'
    'email'
    'va_done'
    'va_result'
    'va_rad1'
    'va_rad2'
    'toade'
    'toade_date'
    'warranty'
    'warranty_type'
    'warranty_rad1'
    'warranty_rad2'
    ]

template.notes = ->
    """
    <div class='w3-container w3-border #{main_sz}'>
    Agent Description: <br /> 
        <input type='text' id='agent_desc' placeholder='Issue' style='width:100%'>
    </div>
    <div class='w3-container w3-border w3-rest'>
    Symptoms: <br /> 
        <textarea id='symptoms' placeholder='Describe what&#39;s happening.' style='width:100%; resize: none' />
    </div>
    <div class='w3-container w3-border w3-rest'>
    Troubleshooting Steps: <br /> 
        <textarea id='ts_steps' placeholder='Describe what happened on the call.' style='width:100%;height:200px;resize:none' />
    </div>
    """

template.notes.ids = [
    'agent_desc'
    'symptoms'
    'ts_steps'
    ]

template.diagResults = ->
    input_w = '28vw'
    """
    <div class='w3-container w3-border #{main_sz}'>
        <div class='w3-container'>
            <input type='text' id='diag_tool' placeholder='Diagnostics Used' style='width: #{input_w}'>
            Result:    
            <select id='diag_result'>
                <option>N/A</option>
                <option>Pass</option>
                <option>Fail</option>
            </select>
        </div>
        <br />
        <div class='w3-container'>
            <input type='text' id='err_code' placeholder='Error Code' style='width: #{input_w}'>
            <input type='text' id='valid_code' placeholder='Validation Code' style='width: #{input_w}'>
        </div>
        <br />
        <div class='w3-container'>
            <input type='text' id='dc_id' placeholder='Dell Connect ID' style='width: #{input_w}'>
            <input type='text' id='tag_team_id' placeholder='Tag Team Chat ID' style='width: #{input_w}'>
        </div>
    </div>
    """

template.diagResults.ids = [
    'diag_tool'
    'diag_result'
    'err_code'
    'valid_code'
    'dc_id'
    'tag_team_id'
    ]
    
template.conclusions = ->
    """
    <div class='w3-container w3-border #{main_sz}'>
    Conclusions: <br />
        <textarea id='conclusions' placeholder='How was the issue resolved?/5 GL' style='width:100%;height:100px;resize:none' />
        <br />
        <input type='checkbox' id='esupport'> Educate about eSupport and self-help options?
        <br />
        <input type='checkbox' id='heatcheck'> Did heatcheck with cx?
        <br />
            <input type='radio' name='cx_sat' id='hc_rad1' value='Cx is Satisfied' disabled> Cx is Satisfied
            <input type='radio' name='cx_sat' id='hc_rad2' value='Cx is Dissatisfied' disabled> Cx is Dissatisfied
        <br />
        <textarea id='dsat_reason' placeholder='If cx is DSAT, explain why:' style='width:100%;height:75px;resize:none'/>
        <br />
        <input type='checkbox' id='resolved' /> Is issue resolved?
        <br />
            <input type='radio' name='issue_resolved' id='reso_rad1' value='Resolved' disabled/> Resolved
            <input type='radio' name='issue_resolved' id='reso_rad2' value='Unresolved/Dispatch' disabled/> Unresolved/Dispatch
    </div>
    """

template.conclusions.ids = [
    'conclusions'
    'esupport'
    'heatcheck'
    'hc_rad1'
    'hc_rad2'
    'dsat_reason'
    'resolved'
    'reso_rad1'
    'reso_rad2'
    ]

template.dispatchNotes = ->
    """
    <div class='w3-container w3-border #{main_sz}'>
        <input type='checkbox' id='adv_data_loss'> Reminded cx of possible Data loss when unit is sent in for repairs or when OSRI/Reset is done?
        <br />
        <select id='adv_data_loss_val' disabled>
            <option>--SELECT--</option>
            <option>Cx agrees to reimage drive</option>
            <option>Cx doesn&#39;t agree to reimage drive</option>
        </select>
        <br />
        <input type='checkbox' id='auto_selector_used'> Auto Parts Selector Used?
        <input type='checkbox' id='vdi'> Verify Dispatch Information? <br />
        <input type='checkbox' id='tat'> Turn Around Time
        <select id='tat_val' disabled>
            <option>--SELECT--</option>
            <option>1 - 2 bd</option>
            <option>5 - 7 bd</option>
            <option>7 - 10 bd</option>
            <option>10 - 15 bd</option>
        </select> <br />
        <input type='checkbox' id='tarp'> Told About Return policy?
        <input type='checkbox' id='cidar'> CIDAR Explained?
    </div>
    """
    
template.dispatchNotes.ids = [
    'adv_data_loss'
    'adv_data_loss_val'
    'auto_selector_used'
    'vdi'
    'tat'
    'tat_val'
    'tarp'
    'cidar'
    ]

template.buttons = ->
    """
    <div class='w3-container w3-border #{main_sz}'>
        <div class='w3-container'>
            <button class='w3-btn-block w3-border w3-ripple' id='agent_desc_btn'>Agent Description</button>
        </div>
        <div class='w3-container'>
            <button class='w3-btn-block w3-border w3-ripple' id='symptoms_btn'>Symptoms</button>
        </div>
        <div class='w3-container'>
            <button class='w3-btn-block w3-border w3-ripple' id='ts_steps_btn'>Create Notes</button>
        </div>
        <div class='w3-container'>
            <button class='w3-btn-block w3-border w3-ripple' id='conclusions_btn'>Conclusions/5 GL</button>
        </div>
    </div>
    """
template.buttons.ids = [
    'agent_desc_btn'
    'symptoms_btn'
    'ts_steps_btn'
    'conclusions_btn'
    ]
    
template.note = (input) ->
    time = render_time(8)
    """
    BTTR: #{input.bttr} \r
    PTR/KCS/OKB ID: #{input.ptr_id} \r
    Service Tag: #{input.svc_tag} \r
    ----- \r
    PPN: #{isBlank(input.ppn)} \r
    APN: #{isBlank(input.apn)} \r
    Email: #{isBlank(input.email)} \r
    VA Passed: #{checkboxHandler(input.va_done, input.va_rad1, input.va_rad2)} \r
    TOADE: #{(-> 
    if input.toade is true
        input.toade_date
    else 'n/a'
    )()} \r
    Entitlement: #{checkboxHandler(input.warranty, input.warranty_rad1, input.warranty_rad2)} \r
    ----- \r
    Agent Description: #{input.agent_desc} \r
    ----- \r
    Symptoms: #{input.symptoms} \r
    ----- \r
    T/S Steps: \r
    \r
    #{input.ts_steps}\r
    -----\r
    Conclusions: #{input.conclusions} \r
    Heatcheck: #{checkboxHandler(input.heatcheck, input.hc_rad1, input.hc_rad2)} \r
    DSAT Reason: #{isBlank(input.dsat_reason)} \r
    Issue Resolved?: #{checkboxHandler(input.resolved, input.reso_rad1, input.reso_rad2)} \r
    ----- \r
    Diagnostics Used: #{(-> 
    if isBlank(input.diag_tool) is 'no'
        'N/A'
    else input.diag_tool
    )()}\r
    Result: #{input.diag_result} \r
    Error Code: #{isBlank(input.err_code)} \r
    Validation Code: #{isBlank(input.valid_code)} \r
    Dell Connect: #{isBlank(input.dc_id)} \r
    Tag Team Chat: #{isBlank(input.tag_team_id)} \r
    -----\r
    Educated Possible Data Loss: #{(->
    if input.adv_data_loss is true
        input.adv_data_loss_val
    else 'N/A'
    )()} \r
    Auto Parts Selector Used?: #{isChecked(input.auto_selector_used)} \r
    Verified Dispatch Info?: #{isChecked(input.vdi)} \r
    Turn Around Time: #{(->
    if input.tat is true
        input.tat_val
    else 'N/A'
    )()} \r
    Told About Return Policy: #{isChecked(input.tarp)}\r
    CIDAR Explained?: #{isChecked(input.cidar)}\r
    \r
    Note Generated on #{days[time.day]}, #{months[time.month]} #{time.date} #{time.year}, #{catZero(time.hours)}:#{catZero(time.minutes)}:#{catZero(time.seconds)} #{time.diem}, Manila
    """

template.savedNote = (input) ->
    """
    <div class='w3-container w3-border w3-rest #{main_sz}' id= #{input.svc_tag}>
    #{input.svc_tag}, #{input.caller_name} 
    <button id='#{input.svc_tag}-del' class='w3-btn w3-border w3-hover-light-grey w3-right'>Delete</button>
    <button id='#{input.svc_tag}-load' class='w3-btn w3-border w3-hover-light-grey w3-right'>Load</button>
    </div>
    """
    
all_ids = template.callInfo.ids.concat(
    template.cxInfo.ids
    template.notes.ids
    template.diagResults.ids
    template.conclusions.ids
    template.dispatchNotes.ids
    )

template.JSONscreen = ->
    """
    <div class='w3-container w3-border w3-rest'>
        <p>WARNING: Do not change the contents of the textarea below 
        if you don't know what you are doing</p>
        <p>Below are the saved notes in JSON format that coul be used
        to export notes between Notemkr instances.</p>
        <p>You can add another JSON object to the end of the area
        to manually add another note to the note storage.</p>
            <textarea id='json_here' style='width:100%;height:60vh;resize:none' />
        <br />
        <button id='import' class='w3-btn w3-border w3-hover-light-grey'>Import</button>
    </div>
    """
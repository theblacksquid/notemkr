main_sz = 'w3-rest'
side_col = 'w3-quarter'

template = {}

template.main = ->
    """
    <div id='container' class='w3-container' style='background-color: steelblue'>
        <div id='header' class='w3-container w3-row'>
          <!---  <div class='w3-container'><img src='img/dell_icon.png.ico'></div> --->
            <div class='w3-container'><h2>NOTEMKR</h2></div>
        </div>
        <div class='w3-container w3-row'>
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
        <input type='text' id='bttr' placeholder='BTTR'>
        <input type='text' id='ptr_id' placeholder='PTR/OKB ID'>
        <input type='text' id='svc_tag' placeholder='Service Tag'> <br />
        <input type='checkbox' id='dps_case'> Dispatch Case? 
    </div>
    """

template.cxInfo = ->
    """
    <div class='w3-container w3-border #{main_sz}'>
        <input type='text' id='caller_name' placeholder='Caller&#39;s Name'>
        <input type='text' id='ppn' placeholder='Primary Phone #'> 
        <input type='text' id='apn' placeholder='Alternate Phone #'> 
        <br />
        <input type='text' id='email' placeholder='Email Address'>
        <br />
        <input type='checkbox' id='va_done'> Service Authorization
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

template.diagResults = ->
    input_w = '28vw'
    """
    <div class='w3-container w3-border #{main_sz}'>
        <div class='w3-container'>
            <input type='text' id='diag_tool' placeholder='Diagnostics Used' style='width: #{input_w}'>
            Result:    
            <select id='diag_result'>
                <option value='neither'>N/A</option>
                <option value='pass'>Pass</option>
                <option value='fail'>Fail</option>
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
    
template.conclusions = ->
    """
    <div class='w3-container w3-border #{main_sz}'>
    Conclusions: <br />
        <textarea id='conclusions' placeholder='How was the issue resolved?/5 GL' style='width:100%;height:100px;resize:none' />
        <br />
        <input type='checkbox' id='heatcheck'> Did heatcheck with cx?
        <br />
            <input type='radio' name='cx_sat' id='hc_rad1' disabled> Cx is Satisfied
            <input type='radio' name='cx_sat' id='hc_rad2' disabled> Cx is Dissatisfied
        <br />
        <textarea id='dsat_reason' placeholder='If cx is DSAT, explain why:' style='width:100%;height:75px;resize:none'/>
        <br />
        <input type='checkbox' id='resolved' /> Is issue resolved?
        <br />
            <input type='radio' name='issue_resolved' id='reso_rad1' disabled/> Resolved
            <input type='radio' name='issue_resolved' id='reso_rad2' disabled/> Unresolved/Dispatch
    </div>
    """


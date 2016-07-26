template = {}

template.main = ->
    """
    <div id='container' class='w3-container w3-blue'>
        <div id='header' class='w3-container w3-row'>
          <!---  <div class='w3-container'><img src='img/dell_icon.png.ico'></div> --->
            <div class='w3-container'><h2>NOTEMKR</h2></div>
        </div>
        <div class='w3-container w3-row'>
            <div id='sidebar' class='w3-container w3-quarter' style='font-size: small'>
                <div class='w3-container'></div>
                <div id='clocks-main' class='w3-container'></div>
                <div class='w3-border w3-center'>
                ----------
                </div>
                <div id='clocks-many' class='w3-container' style='height: 35vh; overflow: auto'></div>
            </div>
            
            <div id='main' class='w3-container'></div>
        </div>
    </div>
    """

template.clock = (title) ->
    """
    <div class='w3-container w3-border'>
        <div id='#{title}-clock'></div>
        <div>#{title}</div> 
    </div>
    """
    
template.cxInfo = ->
    """
    """

template.notes = ->
    """
    """
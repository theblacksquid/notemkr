template = {}

template.main = ->
    """
    <div id='container' class='w3-container w3-blue'>
        <div id='header' class='w3-container'>
            <img src='img/dell_icon.png.ico'>
            <h2>NOTEMKR</h2>
        </div>
        <div class='w3-container w3-row'>
            <div id='sidebar' class='w3-container'></div>
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


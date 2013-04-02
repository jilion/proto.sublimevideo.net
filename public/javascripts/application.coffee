window.SublimeVideo = {}

if navigator.userAgent.match(/iPhone/i) or navigator.userAgent.match(/iPad/i)
  viewportmeta = document.querySelector("meta[name=\"viewport\"]")
  if viewportmeta
    viewportmeta.content = "width=device-width, minimum-scale=1.0, maximum-scale=1.0"
    document.addEventListener("gesturestart", (()->
      viewportmeta.content = "width=device-width, minimum-scale=0.25, maximum-scale=1.6"
    ), false)

sublime.ready ->
  SublimeVideo.HomeDemoInstance = new SublimeVideo.HomeDemo("#home_demo_player")
  
class SublimeVideo.HomeDemo
  constructor: (player) ->
    @player = $(player)
    @features = $('ul.demo-video-actions')
    @kitSelector = $('ul.demo-choose-design')
    @setupObservers()
    
  setupObservers: ->
    @features.find('li a').each (index, element) =>
      @manageTogglerBtn(element, 'feature')
    @kitSelector.find('li a').each (index, element) =>
      @manageTogglerBtn(element, 'kit')
  
  manageTogglerBtn: (element, attribute) ->
    btn = $(element)
    btn.on 'click', (event) =>
      if attribute is "kit" then @kitSelector.find('li').removeClass('active')
      event.preventDefault()
      @setupAttribute btn.data(attribute)
      btn.parent().toggleClass('active')
    
  setupAttribute: (value) ->
    @unprepareVideo()
    switch value
      when 9, 10, 11
        @player.attr('data-player-kit',value)
      when "youtube"
        if @player.attr('data-youtube-id')?
          @player.removeAttr('data-youtube-id')
        else
          @player.attr('data-youtube-id','rAq2rNEru8A')
      when "cue_zones"
        # console.log "Cue Zones"
      else
        attribute_data = 'data-'+value+'-enable'
        if @player.attr(attribute_data ) is "true"
          @player.attr(attribute_data , "false")
        else
          @player.attr(attribute_data , "true")
    @prepareAndPlayVideo()
    
  unprepareVideo: ->
    sublime.unprepare @player[0]
    
  prepareAndPlayVideo: ->
    @player.attr('data-autoplay','true')
    sublime.prepare @player[0]
    
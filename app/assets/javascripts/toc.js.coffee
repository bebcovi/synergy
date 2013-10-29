jQuery ($) ->

  $.scrollTo = ($el, subtract = 0) ->
    $("html, body")
      .stop()
      .animate
        scrollTop: $el.offset().top - 10 - subtract
      , 600

  module =

    init: ->
      self = this
      self.configure()
      self.setup()
      self.triggerFixed()

    setup: ->
      self = this
      self.config.$toc
        .width(self.config.$content.width())
        .on "click", "a", do (self) ->
          (event) ->
            event.preventDefault()

            selector      = $(@).attr("href")
            $el           = $(selector)

            $.scrollTo($el, 2 * self.config.bsu)

    triggerFixed: ->
      self    = this
      $window = $(window)
      offset  = self.config.$toc.offset()

      $window.on "scroll", do (self) ->
        ->
          if $window.scrollTop() >= offset.top + 1
            self.config.$toc.addClass("is-fixed")
          else
            self.config.$toc.removeClass("is-fixed")

    configure: ->
      @config =
        $content: $(".main_content")
        $toc:     $(".toc")
        bsu:      26


  module.init()

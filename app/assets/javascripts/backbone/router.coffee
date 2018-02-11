FolioKevin.Router = Backbone.Router.extend
  routes:
    '': 'showPage'
    ':slug': 'showPage'

  initialize: ->
    @rootSlug = '/'
    @body = $('body')
    FolioKevin.initProjectsListIsotope()

  showPage: (slug = @rootSlug) ->
    duration = 220
    $('.fade-content, #footer').fadeOut duration, =>
      if ($('.fade-content:animated, #footer:animated').length == 0)
        $('main').load slug + ' .fade-content', (response) =>
          $(FolioKevin.projectsContainer).isotope() if slug == @rootSlug
          $('.fade-content, #footer').hide().fadeIn(duration)
          @closeFilter()
          @setTitle(response)
          @setBodyClass(slug)

  setTitle: (response) ->
    document.title = $(response).filter('title').text()

  setBodyClass: (slug) ->
    if slug == @rootSlug
      @body.removeClass('inner-page')
    else
      @body.addClass('inner-page')

  closeFilter: ->
    $('.filter').hide()
    @body.removeClass('opened-filter')

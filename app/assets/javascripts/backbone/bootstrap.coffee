$ ->
  $document = $(document)

  # Initialize router and history
  FolioKevin.Router = new FolioKevin.Router
  Backbone.history.start({pushState: true, silent: true})

  new FolioKevin.ProjectsFilterView

  # Enable ajax links
  $document.on 'click', '[data-push]', (e) ->
    e.preventDefault()
    href = $(this).attr('href')
    Backbone.history.navigate(href, true)

  # Mail protection
  $('.email').each ->
    $this = $(this)
    protectedEmail = $this.html().replace(' [at] ', '@').replace(' [dot] ', '.')
    $this.html(protectedEmail)
    email = $this.text().trim()
    $this.replaceWith('<a href="mailto:' + email + '" class="special-link">' + email + '</a>')

  # Keyboard navigation
  $document.keydown (e) ->
    # Escape
    FolioKevin.goHome() if e.which == 27
    # Left arrow
    $('.project__navigation-link--prev').click() if e.which == 37
    # Right arrow
    $('.project__navigation-link--next').click() if e.which == 39

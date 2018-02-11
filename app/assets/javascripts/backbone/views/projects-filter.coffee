FolioKevin.ProjectsFilterView = Backbone.View.extend
  initialize: ->
    $(document).on 'click', '.filter-button', => @toggleMenu()
               .on 'click', '.filter-list a', (e) => @filterProjects(e)

  toggleMenu: ->
    $body = $('body')
    if $body.hasClass('inner-page')
      FolioKevin.goHome()
    else
      $('html, body').animate({ scrollTop: 0 }, 450) unless $body.hasClass('opened-filter')
      $body.toggleClass('opened-filter')

  filterProjects: (e) =>
    e.preventDefault()
    $this = $(e.currentTarget)

    # Filter projects
    filterValue = $this.attr('data-filter')
    $(FolioKevin.projectsContainer).isotope({ filter: filterValue })

    # Toggle selected class
    $('.filter-list a').removeClass('selected')
    $this.addClass('selected')

$ ->
  $filterLink = $('.filter-list a')

  $projectsList = $('.projects-list').isotope({
    itemSelector: '.projects-list li',
    layoutMode: 'fitRows'
  })

  $('.filter-button').click ->
    $body = $('body')
    $body.toggleClass('opened-filter')
    TweenMax.to(window, .5, {scrollTo: { y: 0, autoKill: true}}) if $body.hasClass('opened-filter')

  $filterLink.click (e) ->
    e.preventDefault()
    $this = $(this)

    # Filter projects
    filterValue = $this.attr('data-filter')
    $projectsList.isotope({ filter: filterValue })

    # Toggle selected class
    $filterLink.removeClass('selected')
    $this.addClass('selected')

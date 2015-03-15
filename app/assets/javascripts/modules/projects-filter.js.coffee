'use strict'

$projectsList = $('.projects-list').isotope({
  itemSelector: '.projects-list-item',
  layoutMode: 'fitRows'
})

$('.filter-button').click ->
  $body = $('body')
  $body.toggleClass('opened-filter')
  TweenMax.to(window, .5, {scrollTo: { y: 0, autoKill: true}}) if $body.hasClass('opened-filter')

$('.filter-list-item a').click (e) ->
  e.preventDefault()
  $this = $(this)

  # Filter projects
  filterValue = $this.attr('data-filter')
  $projectsList.isotope({ filter: filterValue })

  # Toggle selected class
  $('.filter-list-item a').removeClass('selected')
  $this.addClass('selected')

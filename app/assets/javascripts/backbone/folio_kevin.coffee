#= require_self
#= require ./bootstrap
#= require ./router
#= require_tree ./views

window.FolioKevin ||=
  projectsContainer: '.projects-list'

  initProjectsListIsotope: ->
    $projectsList = $(@projectsContainer).isotope
      itemSelector: '.projects-list li'
      layoutMode: 'fitRows'

  goHome: ->
    FolioKevin.Router.navigate('/', {trigger: true})

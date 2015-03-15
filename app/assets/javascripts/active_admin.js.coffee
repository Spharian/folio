#= require active_admin/base
#= require activeadmin-sortable

$ ->
  # As ActiveAdmin do not have a target blank config option on site_title
  $('.site_title a').attr('target', 'blank')

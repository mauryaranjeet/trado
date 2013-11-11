#= require jquery
#= require jquery_ujs
#= require admin/ace-elements.min
#= require admin/ace.min
#= require admin/bootstrap.min
#= require admin/bootstrap-tag.min
#= require admin/jquery-ui-1.10.3.custom.min
#= require admin/jquery.slimscroll.min
#= require admin/jquery.ui.touch-punch.min

remove_fields = (link) ->
  $(link).prev("input[type=hidden]").val "1"
  $(link).closest(".ajax_fields").remove()
add_fields = (link, association, content) ->
  new_id = new Date().getTime()
  regexp = new RegExp("new_" + association, "g")
  $("#dimension_fields").append content.replace(regexp, new_id)
duplicate_fields = (checkbox, field_one, field_two) ->
  $(checkbox).change ->
    if @checked
      $(field_two).val $(field_one).val()
    else
      $(field_two).val ""

$(document).ready ->
  duplicate_fields ".invoice_address", ".billing_textarea", ".delivery_textarea"

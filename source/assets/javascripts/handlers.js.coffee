attach_body_handlers = ->        
  $('.state .called').click (evt) ->
    key = $(evt.target).closest('.state').attr('id')
    val = $(evt.target).data('val')
    window.data.set_attr key, 'called', val
    window.set_total()
    
  $('.state').click (evt) ->
    state_id = $(evt.target).attr 'id'
    state_ct = parseInt(localStorage[state_id]) + 1
    localStorage[state_id] = state_ct
    
window.handler_fns = ->
  $('#reset').click (evt) ->
    window.reset_storage()
    window.redraw()
    attach_body_handlers()
  attach_body_handlers()


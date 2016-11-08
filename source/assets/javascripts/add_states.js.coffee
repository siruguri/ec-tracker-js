window.set_total = ->
  totals = {dem: 0, rep: 0}
  window.data.array.forEach (e, idx) ->
    if e.called == 'rep' || e.called == 'dem'
      use_switch = e.called
    else
      use_switch = e.goes_for
      
    if use_switch == 'dem'
      totals.dem += e.number_votes
    else if use_switch == 'rep'
      totals.rep += e.number_votes
      
  tot = 538
  lg1 = totals.dem * 100 / tot
  lg2 = totals.rep * 100 / tot
  rem = 100 - (lg1 + lg2)
  bk_val = ('linear-gradient(to right, rgb(23, 158, 224) 0%, rgb(23, 158, 224) ' + lg1 + '%, #eaeaea ' + lg1 + ('%, #eAeaea ' + (lg1 + rem) + '%, rgb(255, 93, 64) ' + (lg1 + rem) + '%, rgb(255, 93, 64) 100%)')  )
  $('#count').css('background', bk_val)
  
window.reset_storage = ->
  localStorage['app_model_array'] = JSON.stringify(window.data.orig_array)
  window.data.array = []
  window.data.orig_array.forEach (e, i) ->
    window.data.array.push e
  
window.use_storage = ->
  window.data.array = JSON.parse localStorage.app_model_array

new_div = (str) ->
  $('<div>').addClass str

window.redraw = ->  
  window.set_total()
    
  root = $('#states')
  root.html('')
  window.data.array.forEach (e, idx) ->
    base = new_div 'row state'
    st_name = new_div 's3 col'

    base.append st_name
    st_name.text e.state_name
    if e.id != ''
      base.attr('id', e.id)
    st_name.attr('data-local-count', localStorage.getItem(e.id))
    root.append base

    ac1 = new_div 'col s3'
    ac1.attr('data-number-votes', e.number_votes)
    ac1.text e.number_votes
    base.append ac1

    called = new_div 'col s6'
    called.html(_.template($('#switch-template').html())({key: e.id}))

    called.find('input[type=radio]').each (i) ->
      if $(this).data('val') == e.called
        $(this).attr('checked', 'checked')
        
    base.append called
    
add_fns = ->
  # app initialize
  if !localStorage.getItem('app_model_array')
    window.reset_storage()
  else
    use_storage()
  window.redraw()
  window.handler_fns()
    
$(document).ready add_fns    

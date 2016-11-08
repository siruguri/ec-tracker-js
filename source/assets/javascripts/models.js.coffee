window.data = new Object
  orig_array: [{id: 'ca', state_name: 'CA', number_votes: 55, goes_for: 'dem', called: 'none'}, {goes_for: 'rep', id: 'tx', state_name: 'TX', number_votes: 38, called: 'none'},  {id: 'ny', state_name: 'NY', called: 'none', goes_for: 'dem', number_votes: 29}]
  
  _set_attr: (key, attr_name, val) ->
    ret = null
    @array.forEach (rec, i) ->
      if rec.id == key
        rec[attr_name] = val
        ret = val
    if ret != null
      # Store locally
      localStorage.app_model_array = JSON.stringify(@array)
    return ret

window.data.set_attr = window.data._set_attr.bind(window.data)

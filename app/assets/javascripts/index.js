$(function(){
  $('.undo-btn').click(function(){
    var previous_text = $('.previous-text')[0].value
    $('.initial-text-box').val(previous_text)
    this.remove()
  })
  $('.text-select').on('change', function(){
    var selected_text = this.value
    $('.initial-text-box').val(selected_text)
  });
  var seq = 1;
  $('.add-action-btn').click(function(){
    var current = seq;
    seq += 1;
    var selected_action_id = $('.action-select').val();
    var selected_text = $('.action-select option[value='+selected_action_id+']').text();
    if (selected_action_id == '10' || selected_action_id == '11')
      var block = '<div class="action-item"> \
        <input type="hidden" value="'+selected_action_id+'" name="operations['+current+'][name]"> \
        <span class="action-label">'+selected_text+'</span><br> \
        <textarea name="operations['+current+'][args][0]" type="text" class="action-args" placeholder="Text to splice with" rows="7" cols="30" required /></textarea> \
        <button type="button" class="remove-action-btn">Remove</button> \
      </div>';
    else if (selected_action_id == '12')
      var block = '<div class="action-item"> \
        <input type="hidden" value="'+selected_action_id+'" name="operations['+current+'][name]"> \
        <span class="action-label">'+selected_text+'</span><br> \
        <textarea name="operations['+current+'][args][0]" type="text" class="action-args" placeholder="Target" required /></textarea> \
        <textarea name="operations['+current+'][args][1]" type="text" class="action-args" placeholder="Replacement" required /></textarea> \
        <button type="button" class="remove-action-btn">Remove</button> \
      </div>';
    else if (selected_action_id == '13')
      var block = '<div class="action-item"> \
        <input type="hidden" value="'+selected_action_id+'" name="operations['+current+'][name]"> \
        <span class="action-label">'+selected_text+'</span><br> \
        <textarea name="operations['+current+'][args][0]" type="text" class="action-args" placeholder="Replacement" required /></textarea> \
        <button type="button" class="remove-action-btn">Remove</button> \
      </div>';
    else if (selected_action_id == '14')
      var block = '<div class="action-item"> \
        <input type="hidden" value="'+selected_action_id+'" name="operations['+current+'][name]"> \
        <span class="action-label">'+selected_text+'</span><br> \
        <textarea name="operations['+current+'][args][0]" type="text" class="action-args" rows="7" cols="30" placeholder="Text to swap nouns with" required /></textarea> \
        <button type="button" class="remove-action-btn">Remove</button> \
      </div>';
    else
      var block = '<div class="action-item"> \
        <input type="hidden" value="'+selected_action_id+'" name="operations['+current+'][name]"> \
        <span class="action-label">'+selected_text+'</span> \
        <input type="hidden" name="operations['+current+'][args][0]" type="text"> \
        <button type="button" class="remove-action-btn">Remove</button> \
      </div>';
    var item = $(block)
    $('.added-actions').append(item);
    $('.remove-action-btn').click(function() {
      $(this).parent().remove();
    });
  })

})

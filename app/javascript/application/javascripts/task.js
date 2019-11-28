import Rails from '@rails/ujs';

document.addEventListener('DOMContentLoaded', function() {
  if (document.getElementById('task_title')) {
    document
      .getElementById('task_category')
      .addEventListener('change', function(e) {
        var user_type_id = e.target.value;
        var campaign_id = document.getElementById('campaign_id').value;
        Rails.ajax({
          url: '/task_coworkers',
          type: 'GET',
          data: `user_type_id=${user_type_id}&campaign_id=${campaign_id}`
        });
      });
  }
});

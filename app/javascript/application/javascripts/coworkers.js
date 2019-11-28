import Rails from '@rails/ujs';

document.addEventListener('DOMContentLoaded', function() {
  if (document.getElementById('coworker_user_id')) {
    document
      .getElementById('coworker_user_id')
      .addEventListener('change', function(e) {
        var user_id = e.target.value;
        Rails.ajax({
          url: '/roles',
          type: 'GET',
          data: `user_id=${user_id}`,
          success: function(response) {
            addOtherSelect(response);
          }
        });
      });
  }
});

function addOtherSelect(response) {
  var roles = response.roles;
  var select_array = [];
  roles.forEach(role => {
    select_array.push(getArray(role));
  });

  var select = document.getElementById('coworker_role');
  select.options.length = 0;
  for (let index = 0; index < select_array.length; index++) {
    select.options[select.options.length] = new Option(
      select_array[index][0],
      select_array[index][1]
    );
  }
}

function getArray(role) {
  if (role === 'content_creator') {
    return ['Generador de contenidos', 1];
  } else {
    return ['Diseñador', 0];
  }
}

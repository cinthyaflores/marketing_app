document.addEventListener('DOMContentLoaded', function() {
  if (document.getElementById('show-input')) {
    document
      .getElementById('show-input')
      .addEventListener('click', function(e) {
        e.preventDefault();
        document.getElementById('company-id').classList.remove('d-none');
      });
  }
});

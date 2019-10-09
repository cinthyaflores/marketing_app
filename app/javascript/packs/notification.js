document.addEventListener('DOMContentLoaded', function() {
  if (document.getElementsByClassName('notification')) {
    setTimeout(function() {
      document
        .getElementsByClassName('notification')[0]
        .classList.add('is-hidden');
    }, 5000);
  }
});

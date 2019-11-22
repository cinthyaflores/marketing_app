document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('burger-menu').addEventListener('click', function() {
    document.getElementById('navbar').classList.toggle('is-active');
  });
});

document.addEventListener('DOMContentLoaded', function() {
  var form = document.querySelector('.search');
  document.querySelector('.searchBtn').addEventListener('click', function() {
    form.submit();
  });

  document.querySelector('#q').addEventListener('keypress', function(e) {
    if(e && e.keyCode == 13) {
      form.submit();
    }
  });
});

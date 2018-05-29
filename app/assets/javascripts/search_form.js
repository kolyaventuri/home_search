document.addEventListener('DOMContentLoaded', function() {
    var form = document.querySelector('.search');
    document.querySelector('.searchBtn').addEventListener('click', function() {
        form.submit();
    });
});

document.addEventListener('DOMContentLoaded', function() {
    var createLinkTag = function(type, integrity) {
        var tag = document.createElement('link');
        tag.setAttribute('rel', 'stylesheet');
        tag.setAttribute('href', 'https://pro.fontawesome.com/releases/v5.0.13/css/' + type + '.css');
        tag.setAttribute('integrity', integrity);
        tag.setAttribute('crossorigin', 'anonymous');
        return tag;
    };

    var styles = ['all'];
    var integrities = [
      'sha384-oi8o31xSQq8S0RpBcb4FaLB8LJi9AT8oIdmS1QldR8Ui7KUQjNAnDlJjp55Ba8FG',
    ];

    var header = document.head;

    styles.map(function(style, i) {
        var integrity = integrities[i];
        var tag = createLinkTag(style, integrity);
        document.head.appendChild(tag);
    });
});

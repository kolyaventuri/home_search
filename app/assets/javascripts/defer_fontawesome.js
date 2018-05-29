document.addEventListener('DOMContentLoaded', function() {
    var createLinkTag = function(type, integrity) {
        var tag = document.createElement('link');
        tag.setAttribute('rel', 'stylesheet');
        tag.setAttribute('href', 'https://pro.fontawesome.com/releases/v5.0.13/css/' + type + '.css');
        tag.setAttribute('integrity', integrity);
        tag.setAttribute('crossorigin', 'anonymous');
        return tag;
    };

    var styles = ['regular', 'brands', 'fontawesome'];
    var integrities = [
        'sha384-HLkkol/uuRVQDnHaAwidOxb1uCbd78FoGV/teF8vONYKRP9oPQcBZKFdi3LYDy/C',
        'sha384-t3MQUMU0g3tY/0O/50ja6YVaEFYwPpOiPbrHk9p5DmYtkHJU2U1/ujNhYruOJwcj',
        'sha384-LDuQaX4rOgqi4rbWCyWj3XVBlgDzuxGy/E6vWN6U7c25/eSJIwyKhy9WgZCHQWXz'
    ];

    var header = document.head;

    styles.map(function(style, i) {
        var integrity = integrities[i];
        var tag = createLinkTag(style, integrity);
        document.head.appendChild(tag);
    });
});

var timeElements = [];

function start() {
    $(".debt_container .timeLeft").each(function() {
        timeElements.push({
            elem: $(this),
            start: new Date($(this).text())
        });
    });

    updateTime();

    setInterval(updateTime, 1000);
}

function updateTime() {
    for (var i in timeElements) {
        var elem = timeElements[i],
            time = new Date(elem.start - Date.now()),
            diff = dateDiff(Math.abs(time)),
            sign = ' ';

        if (time < 0) {
            sign = '-';
            elem.elem.css('color', 'red');
        } else {
            elem.elem.css('color', 'green');
        }

        elem.elem.text(sign + pad(diff.d, 5) + ':' + pad(diff.h,2,'0') + ':' + pad(diff.m,2,'0') + ':' + pad(diff.s,2,'0'));
    }
}

function dateDiff( diff ) {
    return {
        ms : Math.floor( diff            % 1000 ),
        s  : Math.floor( diff /     1000 %   60 ),
        m  : Math.floor( diff /    60000 %   60 ),
        h  : Math.floor( diff /  3600000 %   24 ),
        d  : Math.floor( diff / 86400000        )
    };
}

function pad(str, len, pad_str) {
    str = String(str);

    if (len <= str.length) {
        return str;
    } else {
        return (pad_str || ' ') + pad(str, len - 1, pad_str);
    }

}
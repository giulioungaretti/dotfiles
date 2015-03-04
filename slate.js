var pushTopRightTwoThirds = slate.operation("corner", {
        "direction": "top-right",
        "width": "screenSizeX/2",
        "height": "2*screenSizeY/3"
});

var pushCenter3 = slate.operation("move", {
        "height": "screenSizeY",
        "width": "screenSizeX/3",
        "x": "screenOriginX+(screenSizeX/3)",
        "y": "screenOriginY",
});
var pushBottomRightOneThird = slate.operation("corner", {
        "direction": "bottom-right",
        "width": "screenSizeX/2",
        "height": "screenSizeY/3"
});
var pushRight = slate.operation("push", {
        "direction": "right",
        "style": "bar-resize:screenSizeX/2"
});

var pushRight3 = slate.operation("push", {
        "direction": "right",
        "style": "bar-resize:screenSizeX/3"
});

var pushLeft = slate.operation("push", {
        "direction": "left",
        "style": "bar-resize:screenSizeX/2"
});
var pushLeft3 = slate.operation("push", {
        "direction": "left",
        "style": "bar-resize:screenSizeX/3"
});
var pushTop = slate.operation("push", {
        "direction": "top",
        "style": "bar-resize:screenSizeY/2"
});
var fullscreen = slate.operation("move", {
        "x": "screenOriginX",
        "y": "screenOriginY",
        "width": "screenSizeX",
        "height": "screenSizeY"
});
var hint = slate.operation("hint", {
        "characters": "JKL;FDSHO"
});

var pushTopRight = slate.operation("corner", {
        "direction": "top-right",
        "width": "screenSizeX/2",
        "height": "screenSizeY/2"
});
var pushBottomRight = slate.operation("corner", {
        "direction": "bottom-right",
        "width": "screenSizeX/2",
        "height": "screenSizeY/2"
});
var pushTopLeft = slate.operation("corner", {
        "direction": "top-left",
        "width": "screenSizeX/2",
        "height": "screenSizeY/2"
});
var pushBottomLeft = slate.operation("corner", {
        "direction": "bottom-left",
        "width": "screenSizeX/2",
        "height": "screenSizeY/2"
});

var l_count = 0;
slate.bind("k:cmd,ctrl", function(win) {
        l_count++;
        if (l_count == 1) {
                win.doOperation(pushTopRight);
        } else if (l_count == 2) {
                win.doOperation(pushBottomRight);
                l_count = 0;
        }
});

var h_count = 0;
slate.bind("j:cmd,ctrl", function(win) {
        h_count++;
        if (h_count == 1) {
                win.doOperation(pushTopLeft);
        } else if (h_count == 2) {
                win.doOperation(pushBottomLeft);
                h_count = 0;
        }
});

var three_count = 0;
slate.bind("l:cmd,ctrl", function(win) {
        three_count++;
        if (three_count == 1) {
                win.doOperation(pushRight);
        } else if (three_count == 2) {
                win.doOperation(pushRight3);
                three_count = 0;
        }
});

var three_count = 0;
slate.bind("h:cmd,ctrl", function(win) {
        three_count++;
        if (three_count == 1) {
                win.doOperation(pushLeft);
        } else if (three_count == 2) {
                win.doOperation(pushLeft3);
                three_count = 0;
        }
});

slate.bind(";:shift,cmd", fullscreen);
slate.bind("i:cmd,ctrl", pushCenter3);
slate.bind("esc:cmd", hint);

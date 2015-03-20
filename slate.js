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
slate.bind("k:shift,cmd,ctrl", function(win) {
        l_count++;
        if (l_count == 1) {
                win.doOperation(pushTopRight);
        } else if (l_count == 2) {
                win.doOperation(pushBottomRight);
                l_count = 0;
        }
});

var h_count = 0;
slate.bind("j:shift,cmd,ctrl", function(win) {
        h_count++;
        if (h_count == 1) {
                win.doOperation(pushTopLeft);
        } else if (h_count == 2) {
                win.doOperation(pushBottomLeft);
                h_count = 0;
        }
});

var rthree_count = 0;
slate.bind("l:shift,cmd,ctrl", function(win) {
        rthree_count++;
        if (rthree_count == 1) {
                win.doOperation(pushRight);
        } else if (rthree_count == 2) {
                win.doOperation(pushRight3);
                rthree_count = 0;
        }
});

var three_count = 0;
slate.bind("h:shift,cmd,ctrl", function(win) {
        three_count++;
        if (three_count == 1) {
                win.doOperation(pushLeft);
        } else if (three_count == 2) {
                win.doOperation(pushLeft3);
                three_count = 0;
        }
});
var pushRight = slate.operation("push", {
        "direction": "right",
        "style": "bar-resize:screenSizeX/2"
});

var pushLeft = slate.operation("push", {
        "direction": "left",
        "style": "bar-resize:screenSizeX/2"
});

var throwNextLeft = slate.operation("throw", {
        "width": "screenSizeX/2",
        "height": "screenSizeY",
        "screen": "next"
});

var throwNextRight = slate.operation("throw", {
        "x": "screenOriginX+(screenSizeX)/2",
        "y": "screenOriginY",
        "width": "screenSizeX/2",
        "height": "screenSizeY",
        "screen": "next"
});

var fullscreen = slate.operation("move", {
        "x": "screenOriginX",
        "y": "screenOriginY",
        "width": "screenSizeX",
        "height": "screenSizeY"
});

var throwNextFullscreen = slate.operation("throw", {
        "x": "screenOriginX",
        "y": "screenOriginY",
        "width": "screenSizeX",
        "height": "screenSizeY",
        "screen": "next"
});

var throwNext = function(win) {
        if (!win) {
                return;
        }
        var winRect = win.rect();
        var screen = win.screen().visibleRect();

        var newX = (winRect.x - screen.x) / screen.width + "*screenSizeX+screenOriginX";
        var newY = (winRect.y - screen.y) / screen.height + "*screenSizeY+screenOriginY";
        var newWidth = winRect.width / screen.width + "*screenSizeX";
        var newHeight = winRect.height / screen.height + "*screenSizeY";
        var throwNext = slate.operation("throw", {
                "x": newX,
                "y": newY,
                "width": newWidth,
                "height": newHeight,
                "screen": "next"
        });
        win.doOperation(throwNext);
};

var pushedLeft = function(win) {
        if (!win) {
                return false;
        }
        var winRect = win.rect();
        var screen = win.screen().visibleRect();

        if (winRect.x === screen.x &&
                winRect.y === screen.y &&
                winRect.width === screen.width / 2 &&
                winRect.height === screen.height
        ) {
                return true;
        }
        return false;
};

var pushedRight = function(win) {
        if (!win) {
                return false;
        }
        var winRect = win.rect();
        var screen = win.screen().visibleRect();

        if (winRect.x === screen.x + screen.width / 2 &&
                winRect.y === screen.y &&
                winRect.width === screen.width / 2 &&
                winRect.height === screen.height
        ) {
                return true;
        }
        return false;
};

var isFullscreen = function(win) {
        if (!win) {
                return false;
        }
        var winRect = win.rect();
        var screen = win.screen().visibleRect();
        if (winRect.width === screen.width &&
                winRect.height === screen.height
        ) {
                return true;
        }
        return false;
};


//slate.bind("left:ctrl,cmd", function(win) {
//if (!win) {
//return;
//}
//if (pushedLeft(win)) {
//win.doOperation(throwNextLeft);
//} else {
//win.doOperation(pushLeft);
//}
//});

//slate.bind("right:ctrl,cmd", function(win) {
//if (!win) {
//return;
//}

//if (pushedRight(win)) {
//win.doOperation(throwNextRight);
//} else {
//win.doOperation(pushRight);
//}
//});

slate.bind("m:ctrl,cmd", function(win) {
        if (!win) {
                return;
        }
        if (isFullscreen(win)) {
                win.doOperation(throwNextFullscreen);
        } else {
                win.doOperation(fullscreen);
        }
});

//slate.bind("down:ctrl,cmd", function(win) {
//if (!win) {
//return;
//}

//if (pushedLeft(win)) {
//win.doOperation(throwNextLeft);
//} else if (pushedRight(win)) {
//win.doOperation(throwNextRight);
//} else if (isFullscreen(win)) {
//win.doOperation(throwNextFullscreen);
//} else {
//throwNext(win);
//}
//});
slate.bind(";:shift,cmd", fullscreen);
slate.bind("i:cmd,ctrl", pushCenter3);
//slate.bind("esc:cmd", hint);
//direction = right|left|up|above|down|below|behind
//app = an app name surrounded by quotes
/// Batch bind everything. Less typing.
S.bnda({
        // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
        "l:ctrl,cmd": S.op("focus", {
                "direction": "right"
        }),
        "h:ctrl,cmd": S.op("focus", {
                "direction": "left"
        }),
        "k:ctrl,cmd": S.op("focus", {
                "direction": "up"
        }),
        "j:ctrl,cmd": S.op("focus", {
                "direction": "down"
        }),
        // Resize Bindings
        // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
        "right:cmd,ctrl": S.op("resize", {
                "width": "+10%",
                "height": "+0"
        }),
        "left:cmd,ctrl": S.op("resize", {
                "width": "-10%",
                "height": "+0"
        }),
        "up:cmd,ctrl": S.op("resize", {
                "width": "+0",
                "height": "-10%"
        }),
        "down:cmd,ctrl": S.op("resize", {
                "width": "+0",
                "height": "+10%"
        }),
        "right:ctrl,alt": S.op("resize", {
                "width": "-10%",
                "height": "+0",
                "anchor": "bottom-right"
        }),
        "left:ctrl,alt": S.op("resize", {
                "width": "+10%",
                "height": "+0",
                "anchor": "bottom-right"
        }),
        "up:ctrl,alt": S.op("resize", {
                "width": "+0",
                "height": "+10%",
                "anchor": "bottom-right"
        }),
        "down:ctrl,alt": S.op("resize", {
                "width": "+0",
                "height": "-10%",
                "anchor": "bottom-right"
        }),
        // Window Hints
        "esc:cmd": S.op("hint"),

        // Switch currently doesn't work well so I'm commenting it out until I fix it.
        //"tab:cmd" : S.op("switch"),

        // Grid
        "esc:ctrl": S.op("grid")
});
// ctrl + cmd + up  -> Maximize the window;If maximized, move it to the next screen.
// ctrl + cmd + down -> Move the window to the next screen.
// ctrl + cmd + left  -> Push window to the left with half size. If already done, move it to the next screen.
// ctrl + cmd + right  -> Push window to the right with half size. If already done, move it to the next screen.
// cmd + cntrl + h/l, move to left/right one press, 1/2 two presses 1/3
// cmd + ctrl + i move 1/3 at the center  | |x| | 
// cmd + cntrl + j/k, move to  corners
// cmd + esc , show hints
// cmd +  shit+ ; = full screen

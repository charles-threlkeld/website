#lang pollen

◊(define inner 2)
◊(define edge (* inner 2))
◊(define color "gray")
◊(define multiplier 1.3)
◊(define tiny 0.1)

@font-face {
    font-family: "Charter";
    src: url('fonts/charter_regular-webfont.woff') format('woff'),
    url('fonts/charter_regular-webfont.ttf') format('truetype');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: "Charter";
    src: url('fonts/charter_bold-webfont.woff') format('woff'),
    url('fonts/charter_bold-webfont.ttf') format('truetype');
    font-weight: bold;
    font-style: normal;
}

@font-face {
    font-family: "Charter";
    src: url('fonts/charter_italic-webfont.woff') format('woff'),
    url('fonts/charter_italic-webfont.ttf') format('truetype');
    font-weight: normal;
    font-style: italic;
}

@font-face {
    font-family: "Charter";
    src: url('fonts/charter_bold_italic-webfont.woff') format('woff'),
    url('fonts/charter_bold_italic-webfont.ttf') format('truetype');
    font-weight: bold;
    font-style: italic;
}

body {
    margin: ◊|edge|em;
    border: ◊|inner|em double ◊|color|;
    padding: ◊|inner|em;
    font-size: ◊|multiplier|em;
    line-height: ◊|multiplier|;
}

h1 {
    font-size: ◊|multiplier|em;
}

#creation {
    font-size: ◊|tiny|em;
    visibility: collapse;
}

#prev, #next {
    position: fixed;
    top: ◊|(/ edge 2)|em;
}

#prev {
    left: ◊|edge|em;
}

#next {
    right: ◊|edge|em;
}

#modified {
    font-size: ◊(/ multiplier 2)em;
}

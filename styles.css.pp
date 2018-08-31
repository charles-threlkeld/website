#lang pollen

◊(define inner 2)
◊(define edge (* inner 2))
◊(define color "gray")
◊(define multiplier 1.3)
◊(define tiny 0.1)

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

var conditionalMap = {
    "==": "sete",
    ":>": "setg",
    "<:": "setl",
    ">=": "setge",
    "<=": "setle",
    "!=": "setne"
}

var mathEnders = [
    "]",">",")",":",",",
]

module.exports = {
    types:{
        "p8": {
            size: 8,
            float: false,
            pointer: true,  
            special: false,
            dblRef: false,
        },
        "p16": {
            size: 16,
            float: false,
            pointer: true,
            special: false,
            dblRef: false,
        },
        "p32": {
            size: 32,
            float: false,
            pointer: true,
            special: false,
            dblRef: false,
        },
        "dp32": {
            size: 64,
            float: false,
            pointer: true,
            special: false,
            dblRef: false,
        },
        "u8": {
            size: 8,
            float: false,
            pointer: false,
            special: false,
            dblRef: false,
        },
        "u16": {
            size: 16, 
            float: false,
            pointer: false,
            special: false,
            dblRef: false,
        },
        "u32": {
            size: 32,
            float: false,
            pointer: false,
            special: false,
            dblRef: false,
        },
        "t8": {
            size: 8,
            float: false,
            pointer: false,
            special: false,
            dblRef: true,
        },
        "t16": {
            size: 16,
            float: false,
            pointer: false,
            special: false,
            dblRef: true,
        },
        "t32": {
            size: 32,
            float: false,
            pointer: false,
            special: false,
            dblRef: true,
        },
        "f32": {
            size: 32,
            float: true,
            pointer: false,
            special: false, 
            dblRef: false
        },
        "___format_template___": {
            size: 0,
            float: false,
            pointer: false,
            special: true,
            dblRef: false,
            formatPtr: null
        },
    },
    keywords: [
        "method","function","format","initializer", "persistent", "while", "return"
    ],
    priorityWords: [
        "while"
    ],
    operators: ["+","-","*","/","<<",">>","|","&","%"],
    symbols: "!@#$%^&*()+{}|:<>?,./;'[]\-=' ",
    conditionalMap,
    conditionals: Object.keys(conditionalMap),
    mathEnders
}
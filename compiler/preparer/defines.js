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
        "any": {
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
        "string": {
            size: 8,
            float: false,
            pointer: true,  
            special: false,
            dblRef: false,
            advptr: true
        },
        "___format_template___": {
            size: 0,
            float: false,
            pointer: true,
            special: true,
            dblRef: false,
            formatPtr: null
        },
        "___special_pointer_template___": {
            size: 0,
            float: false,
            pointer: true,
            special: true,
            hasData: true,
            typePtr: null,
        }
    },
    keywords: [
        "copy", "print_", "println_", "method","function","format","initializer", "persistent", "transient", "while", "return", "return_new", "if", "elif", "else", "__rule", "__define", "own", "borrow"
    ],
    priorityWords: [
        "while"
    ],
    operators: ["+","-","*","/","<<",">>","|","&","%"],
    symbols: "!@#$%^&*()+{}|:<>?,./;[]\\-= ",
    conditionalMap,
    conditionals: Object.keys(conditionalMap),
    mathEnders
}
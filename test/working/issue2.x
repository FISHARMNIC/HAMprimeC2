bob function<> -> auto
{
    return `hello ${123}`;
}

// think its fixed now, issue was return wasnt setting return type of function so it was printing as int (auto)
entry function<> -> auto
{
    print_(bob());
}
/* issue, doing, "\x1B[43m" + c + CRESET where CRESET is a glob string doesnt work */
create CRESET <- "\x1B[0m";

printYellow function<char c>
{
  printf("%s", "\x1B[43m" + c + "\x1B[0m");
}

entry function<>
{
    printYellow('h');
}

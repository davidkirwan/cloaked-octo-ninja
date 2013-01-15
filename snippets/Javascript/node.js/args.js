var myArgs = process.argv.slice(2);
console.log('myArgs: ', myArgs);

switch (myArgs[0]) {
  case 'insult':
    console.log(myArgs[1], 'smells quite badly.');
    break;
  case 'compliment':
    console.log(myArgs[1], 'is really cool.');
    break;
  default:
    console.log('Sorry, that is not something I know how to do.');
}

var http = require('http');

var finalhandler = require('finalhandler')
var serveStatic = require('serve-static')
var handleCommand = require('./commands.js')

var serve = serveStatic("website")

var server = http.createServer(function (req, res) {
  var url = req.url.split("/")
  if (url[0] == "")
    url.splice(0, 1)

  console.log(url)
  if (url[0] == "get") {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    var command = req.url.slice(5)
    res.write(String(handleCommand(command)))
    res.end();
  } else {
    if(url[0] == "") req.url = "index.html"
    var done = finalhandler(req, res);
    serve(req, res, done)
  }
})

server.listen(8080)
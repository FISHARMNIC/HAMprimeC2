var http = require('http');

var finalhandler = require('finalhandler')
var serveStatic = require('serve-static')
var handleCommand = require('./commands.js')

var serve = serveStatic("website")

var server = http.createServer(function (req, res) {

  if (req.method == 'POST') {
    console.log("post")
    var body = ''
    req.on('data', function (data) {
      body += data
    })
    req.on('end', function () {

      body = JSON.parse(body)
      var out = fs.writeFileSync(`${__dirname}/../test/working/${body.currentOpenFile}`, body.textContent)
      if (out) {
        res.end('success')
      } else {
        res.end('fail')
      }
    })

  }
  else {
    var url = req.url.split("/")
    if (url[0] == "")
      url.splice(0, 1)

    console.log(url)
    if (url[0] == "get") {
      var command = req.url.slice(5)
      var out = String(handleCommand(command))
      if (out != -1) {
        res.writeHead(200, { 'Content-Type': 'text/html' });
        res.write(out)
        res.end();
      } else {
        res.writeHead(500);
        res.end();
      }
    } else {
      if (url[0] == "") req.url = "index.html"
      var done = finalhandler(req, res);
      serve(req, res, done)
    }
  }
})

server.listen(8080)
require('child_process').exec(`open http://localhost:8080`);
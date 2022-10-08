

(function() {

  var fs, https, mimetypes, options, path, server;

  fs = require("fs"); // file system
  https = require("https"); // creates an https server
  path = require("path"); // used for working with url paths

  // used to create response headers
  mimetypes = {

    "css":"text/css",
    "html":"text/html",
    "ico":"image/ico",
    "jpg":"image/jpeg",
    "js":"text/javascript",
    "json":"application/json",
    "png":"image/png"

  };

  options = {

    pfx: fs.readFileSync("ssl/crt.pfx"),
    passphrase: "password"

  };

  // Start a secure server that uses the credentials in ssl/crt.pfx
  server = https.createServer(options, function(request, response) {

    // If the url is empty
    if (request.url == "" || request.url == "/") {

      // The user is requesting the home page of the website, so give it to them
      request.url = "index.html";

    }

    // Next we read the file at the requested url and write it to the document.
    fs.readFile(__dirname + "/" + request.url, function(error, content) {

      if (error) { // if there is an error reading the requested url

        console.log("Error: " + error); // output it to the console

      } else { // else, there is no error, write the file contents to the page

        // 200 is code for OK, and the second parameter is our content header
        response.writeHead(200, {'Content-Type':mimetypes[path.extname(request.url).split(".")[1]]});
        response.write(content); // write that content to our response object

      }

      response.end(); // This will send our response object to the browser

    });

  });

  server.listen("1234", "127.0.0.1", function() {

    console.log("Server started!");

  }); // listen on 127.0.0.1:1234

})();

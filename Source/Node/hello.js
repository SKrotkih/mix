const http = require('http');
const fs = require("fs");

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((request, response) => {
  console.log(`Requested URL: ${request.url}`);
  // Get path after '/'
  const filePath = request.url.substr(1);
  // Check if requested file exists
  fs.access(filePath, fs.constants.R_OK, error => {
      if(error){
          response.statusCode = 404;
          response.setHeader('Content-Type', 'text/plain');
          response.end("Resourse not found!\n");
      }
      else{
          fs.createReadStream(filePath).pipe(response);
      }
    });
    // Or one more way:
    // console.log(`Requested URL: ${request.url}`);
    // // Get path after '/'
    // const filePath = request.url.substr(1);
    // fs.readFile(filePath, function(error, data){
    //     if(error){
    //         response.statusCode = 404;
    //         response.setHeader('Content-Type', 'text/plain');
    //         response.end("Resourse not found!\n");
    //     }   
    //     else{
    //         response.end(data);
    //     }
    // });
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});

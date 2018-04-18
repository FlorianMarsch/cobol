let defaultOptions = {
    compileargs:{
        free: true
    }
  };

let Cobol = require("cobol");

const { Console } = require('console');
global.console = new Console(process.stderr, process.stderr);

let start = (path,options,callback)=>{

    let source = __dirname +path;
    let callOptions = {...defaultOptions,...options};
    let finish = (error, data)=>{
        console.log();
        console.log("###################");
        console.log("finished processing");
        console.log(JSON.stringify(options));
        console.log(path);
        if(error){
            console.log("Error: '"+error+"'");
        }
        if(data){
            console.log("Result '"+data+"'");
        }
        console.log();
        callback(error, data);
    }
    console.log("Start Source : "+source);
    Cobol(source, callOptions,finish);
};

module.exports =  start;
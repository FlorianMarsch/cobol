


 var run = require("./runtime");



test('cobol to display arguments', () => {



  run( "/examples/args.cbl", {args: ["Alice"] }, 
    (err, data) => {
      expect(err).toBeNull()
      expect(data).toBe("Your name is:Alice");
    }
  );



});




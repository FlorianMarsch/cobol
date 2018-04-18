


 var run = require("./runtime");

test('cobol to display hello world', () => {

   

    run("/examples/hello-world.cbl", {}, 
      (err, data) => {
        expect(err).toBeNull()
        expect(data).toBe("Hello world");
      }
    );

});

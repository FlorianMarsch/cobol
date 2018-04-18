


 var run = require("./runtime");


/**
 * Accepts two single digit numbers from the user,
 * multiplies them together and displays the result.
 */
test('multiply 2 * 3 = 6', () => {

  var stdin = require('mock-stdin').stdin();

  run( "/examples/multiplier.cbl", {stdin:stdin}, 
    (err, data) => {
      expect(err).toBeNull()
      expect(data).toBe("Result is = 06");
    }
  );

  stdin.push("2\n");
  stdin.push("3\n");

});
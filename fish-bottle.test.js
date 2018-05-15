


var run = require("./runtime");



test('fish-bottle', () => {


var stdin = require('mock-stdin').stdin();
  run("/examples/fish-bottle.cbl", {stdin:stdin},
    (err, data) => {
      expect(err).toBeNull()
      expect(data).toBe("fish-bottle");

   
    }
  );


  stdin.push("15\n");
}
);


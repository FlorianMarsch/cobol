


var run = require("./runtime");




test('fish-bottle', () => {
  run("/examples/fish-bottle.test.cbl", { },
    (err, data) => {
      expect(err).toBeNull()
      expect(data).toBe("GRÜN");

   
    }
  );
}
);





 var run = require("./runtime");

test('cobol to generate uuid', () => {

   

    run("/examples/uuid.cbl", {}, 
      (err, data) => {
        expect(err).toBeNull()
        expect(data.length).toBe(36);
      }
    );

});

const { sysncDB } = require("../../tasks/sync-db");

describe('Pruebas en Sync-DB', () => {

    test('Debe de ejecutar el proceso 2 veces', () => {

        sysncDB();
        const times = sysncDB();
        
        expect(times).toBe( 2 );
    });

});

let times = 0;

const sysncDB = () => {
    times++;
    console.log("Tick cada multiplo de 5:", times);

    return times;
}

module.exports = {
    sysncDB
}
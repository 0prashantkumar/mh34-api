require("dotenv").config();

const getData = require("./getData");
const writeData = require("./wirteData");

(async function main() {
	console.log("Fetching data from sheet");
	let data = await getData(process.env.SHEET_ID_2);
	console.log("Writing data to file");
	writeData(data);
})();

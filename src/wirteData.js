const fs = require("fs");

const writeData = async data => {
	try {
		fs.writeFileSync("./temp/data.json", JSON.stringify(data));
		console.log("Operation Complete");
	} catch (err) {
		console.log(err);
		console.log("Operation Failed");
	}
};

module.exports = writeData;

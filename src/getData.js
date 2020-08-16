const drive = require("drive-db");

const getData = async sheet => {
	let data;

	await drive(sheet).then(resp => (data = resp));

	return data.map(item => (item.confirmed === 0 ? {} : item));
};

module.exports = getData;

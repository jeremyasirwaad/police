const mongoose = require("mongoose");
const jwt = require("jsonwebtoken");
const Joi = require("joi");
const passwordComplexity = require("joi-password-complexity");

const userSchema = new mongoose.Schema({
	companyName: { type: String, required: true },
	ownerName: { type: String, required: true },
	companyLocation: { type: String, required: true },
	policeJurisdiction: { type: String, required: true },
	companyPhone: { type: String, required: true },
	companyEmail: { type: String, required: true },
	GSTnPAN: { type: String, required: true },
	companyType: { type: String, required: true },
	password: { type: String, required: true },
	guestEmployees: { type: Array },
	foreigner: { type: Array },
	tenet: { type: Array }
});

userSchema.methods.generateAuthToken = function () {
	const token = jwt.sign({ _id: this._id }, process.env.JWTPRIVATEKEY, {
		expiresIn: "7d"
	});
	return token;
};

const User = mongoose.model("user", userSchema);

const validate = (data) => {
	const schema = Joi.object({
		companyName: Joi.string().required().label("First Name"),
		ownerName: Joi.string().required().label("Owner Name"),
		companyLocation: Joi.string().required().label("Company Location"),
		policeJurisdiction: Joi.string().required().label("Police Jurisdiction"),
		companyPhone: Joi.string().required().label("Company Phone"),
		companyEmail: Joi.string().required().label("Company Email"),
		GSTnPAN: Joi.string().required().label("GSTnPAN"),
		companyType: Joi.string().required().label("Company Type"),
		password: passwordComplexity().required().label("Password")
	});
	return schema.validate(data);
};

module.exports = { User, validate };

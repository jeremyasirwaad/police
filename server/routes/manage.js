const router = require("express").Router();
const authenticateToken = require("../middleware/tokenauth");
const { User } = require("../models/user");

// POST route to add a guest employee
router.post("/guest", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		console.log(userId); // Assuming you have the user ID stored in the request object after token authentication
		const guestEmployeeData = {
			fullName: req.body.fullName,
			aliasName: req.body.aliasName,
			familyName: req.body.familyName,
			dateOfBirth: req.body.dateOfBirth,
			gender: req.body.gender,
			nativeAddress: req.body.nativeAddress,
			currentAddress: req.body.currentAddress,
			pincode: req.body.pincode,
			phoneNumber: req.body.phoneNumber,
			policeJurisdiction: req.body.policeJurisdiction,
			policeJurisdictionOfAddress: req.body.policeJurisdictionOfAddress,
			fatherName: req.body.fatherName,
			ownerPhone: req.body.ownerPhone,
			aadharNumber: req.body.aadharNumber,
			uploadAadharCard: req.body.uploadAadharCard,
			alternativeIdentity: req.body.alternativeIdentity,
			jobRole: req.body.jobRole,
			dateOfJoining: req.body.dateOfJoining,
			employmentPeriod: req.body.employmentPeriod,
			employmentID: req.body.employmentID,
			photo: req.body.photo
		};

		User.updateOne(
			{ _id: userId },
			{ $push: { guestEmployees: guestEmployeeData } },
			(err, result) => {
				if (err) {
					console.error(err);
					// Handle the error
				} else {
					console.log("Guest employee added successfully");
					console.log(result);
				}
			}
		);

		res.status(201).json({ message: "Guest employee added successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
});

router.post("/foreigner", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		console.log(userId); // Assuming you have the user ID stored in the request object after token authentication

		var foreigner;

		const foreigner1 = {
			fullName: req.body.fullName,
			phoneNumber: req.body.phoneNumber,
			homeCountry: req.body.homeCountry,
			pov: req.body.pov,
			hospitalName: req.body.hospitalName,
			doctorName: req.body.doctorName,
			hospitalLocation: req.body.hospitalLocation,
			passport: req.body.passport,
			visa: req.body.visa
		};

		const foreigner2 = {
			fullName: req.body.fullName,
			phoneNumber: req.body.phoneNumber,
			homeCountry: req.body.homeCountry,
			pov: req.body.pov,
			typeofBusniess: req.body.typeofBusniess,
			timePeriod: req.body.timePeriod,
			passport: req.body.passport,
			visa: req.body.visa
		};

		const foreigner3 = {
			fullName: req.body.fullName,
			phoneNumber: req.body.phoneNumber,
			homeCountry: req.body.homeCountry,
			pov: req.body.pov,
			collegeuniName: req.body.collegeuniName,
			collegeLocation: req.body.collegeLocation,
			uploadcollegeId: req.body.uploadcollegeId,
			passport: req.body.passport,
			visa: req.body.visa
		};

		const foreigner4 = {
			fullName: req.body.fullName,
			phoneNumber: req.body.phoneNumber,
			homeCountry: req.body.homeCountry,
			pov: req.body.pov,
			placeofStay: req.body.placeofStay,
			passport: req.body.passport,
			visa: req.body.visa
		};

		if (req.body.pov === "Medical") {
			foreigner = foreigner1;
		}

		if (req.body.pov === "Commercial") {
			foreigner = foreigner2;
		}

		if (req.body.pov === "Education") {
			foreigner = foreigner3;
		}

		if (req.body.pov === "Tourist") {
			foreigner = foreigner4;
		}

		User.updateOne(
			{ _id: userId },
			{ $push: { foreigner: foreigner } },
			(err, result) => {
				if (err) {
					console.error(err);
					// Handle the error
				} else {
					console.log("Guest employee added successfully");
					console.log(result);
				}
			}
		);

		res.status(201).json({ message: "Foreignerdata added successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
});

router.post("/tenet", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		console.log(userId); // Assuming you have the user ID stored in the request object after token authentication
		const tenetData = {
			fullName: req.body.fullName,
			aliasName: req.body.aliasName,
			dateOfBirth: req.body.dateOfBirth,
			gender: req.body.gender,
			nativeAddress: req.body.nativeAddress,
			currentAddress: req.body.currentAddress,
			pincode: req.body.pincode,
			phoneNumber: req.body.phoneNumber,
			aadharNumber: req.body.aadharNumber,
			uploadAadharCard: req.body.uploadAadharCard,
			alternativeIdentity: req.body.alternativeIdentity,
			tfullName: req.body.tfullName,
			taliasName: req.body.taliasName,
			tdateOfBirth: req.body.tdateOfBirth,
			tgender: req.body.tgender,
			tnativeAddress: req.body.tnativeAddress,
			tcurrentAddress: req.body.tcurrentAddress,
			tpurposeofStay: req.body.tpurposeofStay,
			taadharNumber: req.body.taadharNumber,
			tuploadAadharCard: req.body.tuploadAadharCard,
			talternativeIdentity: req.body.talternativeIdentity
		};

		User.updateOne(
			{ _id: userId },
			{ $push: { tenet: tenetData } },
			(err, result) => {
				if (err) {
					console.error(err);
					// Handle the error
				} else {
					console.log("TenetData added successfully");
					console.log(result);
				}
			}
		);

		res.status(201).json({ message: "TenetData added successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
});

module.exports = router;

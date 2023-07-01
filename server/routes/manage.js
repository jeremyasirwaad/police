const router = require("express").Router();
const authenticateToken = require("../middleware/tokenauth");
const { User } = require("../models/user");
const { v4: uuidv4 } = require("uuid");

// POST route to add a guest employee
router.post("/guest", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		const newId = uuidv4();
		console.log(userId); // Assuming you have the user ID stored in the request object after token authentication
		const guestEmployeeData = {
			id: newId,
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
		const newId = uuidv4();

		var foreigner;

		const foreigner1 = {
			id: newId,
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
			id: newId,
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
			id: newId,
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
			id: newId,
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
		const newId = uuidv4();
		// Assuming you have the user ID stored in the request object after token authentication
		const tenetData = {
			id: newId,
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

//View data

router.get("/guestlist", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		console.log(userId);

		var data; // Assuming you have the user ID stored in the request object after token authentication

		User.find({ _id: userId }, "guestEmployees", (err, result) => {
			if (err) {
				console.error(err);
				// Handle the error
			} else {
				console.log(result[0].guestEmployees);
				res.status(200).json({ message: result[0].guestEmployees });
			}
		});

		// console.log(data[0].guestEmployees);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
});

router.get("/foreignerlist", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		console.log(userId);

		var data; // Assuming you have the user ID stored in the request object after token authentication

		User.find({ _id: userId }, "foreigner", (err, result) => {
			if (err) {
				console.error(err);
				// Handle the error
			} else {
				console.log(result[0].foreigner);
				res.status(200).json({ foreigner: result[0].foreigner });
			}
		});

		// console.log(data[0].guestEmployees);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
});

router.get("/tenetlist", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		console.log(userId);

		var data; // Assuming you have the user ID stored in the request object after token authentication

		User.find({ _id: userId }, "tenet", (err, result) => {
			if (err) {
				console.error(err);
				// Handle the error
			} else {
				console.log(result[0].tenet);
				res.status(200).json({ tenet: result[0].tenet });
			}
		});

		// console.log(data[0].guestEmployees);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
});

//for deletes

router.delete("/guest/:id", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		const guestEmployeeId = req.params.id;

		User.updateOne(
			{ _id: userId },
			{ $pull: { guestEmployees: { id: guestEmployeeId.toString() } } },
			(err, result) => {
				if (err) {
					console.error(err);
					// Handle the error
					res.status(500).json({ error: "Internal server error" });
				} else {
					// console.log();
					if (result.modifiedCount > 0) {
						console.log("Guest employee removed successfully");
						res
							.status(200)
							.json({ message: "Guest employee removed successfully" });
					} else {
						console.log("Guest employee not found");
						res.status(404).json({ error: "Guest employee not found" });
					}
				}
			}
		);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
});

router.delete("/tenet/:id", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		const guestEmployeeId = req.params.id;

		User.updateOne(
			{ _id: userId },
			{ $pull: { tenet: { id: guestEmployeeId.toString() } } },
			(err, result) => {
				if (err) {
					console.error(err);
					// Handle the error
					res.status(500).json({ error: "Internal server error" });
				} else {
					// console.log();
					if (result.modifiedCount > 0) {
						console.log("Tenet employee removed successfully");
						res
							.status(200)
							.json({ message: "Guest employee removed successfully" });
					} else {
						console.log("Guest employee not found");
						res.status(404).json({ error: "Guest employee not found" });
					}
				}
			}
		);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
});

router.delete("/foreigner/:id", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		const guestEmployeeId = req.params.id;

		User.updateOne(
			{ _id: userId },
			{ $pull: { foreigner: { id: guestEmployeeId.toString() } } },
			(err, result) => {
				if (err) {
					console.error(err);
					// Handle the error
					res.status(500).json({ error: "Internal server error" });
				} else {
					// console.log();
					if (result.modifiedCount > 0) {
						console.log("foreigner removed successfully");
						res
							.status(200)
							.json({ message: "Guest employee removed successfully" });
					} else {
						console.log("Guest employee not found");
						res.status(404).json({ error: "Guest employee not found" });
					}
				}
			}
		);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
});

//For UPDATES

router.put("/tenet", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		const tenetId = req.body.id;

		// Assuming you have the user ID stored in the request object after token authentication

		// Create an object with the updated tenet data
		const updatedTenetData = {
			id: req.body.id,
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

		// Find the user and update the specific tenet object
		const result = await User.updateOne(
			{ _id: userId, "tenet.id": tenetId },
			{ $set: { "tenet.$": updatedTenetData } }
		);

		if (result.modifiedCount === 0) {
			// Handle the case where the tenet object is not found
			return res.status(404).json({ error: "Tenet object not found" });
		}

		console.log("TenetData updated successfully");
		console.log(result);

		res.status(200).json({ message: "TenetData updated successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
});

router.put("/guest", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		const guestId = req.body.id;
		console.log(guestId);

		// Assuming you have the user ID stored in the request object after token authentication

		// Create an object with the updated guest employee data
		const updatedGuestEmployeeData = {
			id: req.body.id,
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

		// Find the user and update the specific guest employee object
		const result = await User.updateOne(
			{ _id: userId, "guestEmployees.id": guestId },
			{ $set: { "guestEmployees.$": updatedGuestEmployeeData } }
		);

		if (result.modifiedCount === 0) {
			// Handle the case where the guest employee object is not found
			return res.status(404).json({ error: "Guest employee object not found" });
		}

		console.log("Guest employee data updated successfully");
		console.log(result);

		res
			.status(200)
			.json({ message: "Guest employee data updated successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
});

router.put("/foreigner", authenticateToken, async (req, res) => {
	try {
		const userId = req.userId;
		const foreignerId = req.body.id;
		console.log(foreignerId);

		// Assuming you have the user ID stored in the request object after token authentication

		var foreigner;

		const foreigner1 = {
			id: req.body.id,
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
			id: req.body.id,

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
			id: req.body.id,
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
			id: req.body.id,
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

		// Find the user and update the specific foreigner object based on the "pov" field
		const result = await User.updateOne(
			{
				_id: userId,
				"foreigner.id": req.body.id
			},
			{ $set: { "foreigner.$": foreigner } }
		);

		console.log(result);

		if (result.modifiedCount === 0) {
			// Handle the case where the foreigner object is not found
			return res.status(404).json({ error: "Foreigner object not found" });
		}

		console.log("Foreigner data updated successfully");
		console.log(result);

		res.status(200).json({ message: "Foreigner data updated successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
});

module.exports = router;

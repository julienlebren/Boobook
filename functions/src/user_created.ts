import * as admin from 'firebase-admin';

const db = admin.firestore()
db.settings({ ignoreUndefinedProperties: true })

export async function onUserCreated(user: any): Promise<boolean> {
	if(typeof user.phoneNumber != "undefined") {
		const color = (Math.floor(Math.random() * 10) + 1)

		console.log("user: "+JSON.stringify(user));

		return db.collection("users").doc(user.uid).create({ 
			"emailAddress": user.email,
			"displayName": user.displayName,
			"emailVerified": user.emailVerified,
			"creationTime": new Date(user.metadata.creationTime),
			"lastSeenTime": new Date(user.metadata.creationTime),
			"provider": typeof user.providerData != "undefined" ? user.providerData[0]?.providerId : null,
			"color": color,
			"theme": 0,
			"isSubscribed": false,
			"subscriptionEndTime": null
		}).then(() => {
            return true;
        })
	}
    return false
}
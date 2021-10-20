import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'

admin.initializeApp();

// Called when a new user is created in Firebase
import { onUserCreated } from './user_created'

exports.onUserCreated = functions.auth.user().onCreate(onUserCreated)
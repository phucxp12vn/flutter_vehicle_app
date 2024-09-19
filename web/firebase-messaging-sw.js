importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js");

const firebaseConfig = {
  apiKey: "AIzaSyD-r_3nnmH49BNVZDv_3biCqvygdcW4Hq8",
  authDomain: "flutternotification-41667.firebaseapp.com",
  projectId: "flutternotification-41667",
  storageBucket: "flutternotification-41667.appspot.com",
  messagingSenderId: "952371122223",
  appId: "1:952371122223:web:cf03441c8afb950da1b6da",
  measurementId: "G-98B994M0M6"
};

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

// todo Set up background message handler
messaging.onBackgroundMessage((message) => {
 console.log("onBackgroundMessage", message);
});
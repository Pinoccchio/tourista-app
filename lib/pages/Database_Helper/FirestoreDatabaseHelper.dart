import 'package:cloud_firestore/cloud_firestore.dart';
import 'static_users.dart'; // Import the User class

class FirestoreDatabaseHelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference _usersCollection = _firestore.collection('users');

  // Method to upload static users to Firestore
  static Future<void> uploadStaticUsers() async {
    List<User> staticUsers = [
      User(firstName: 'HWA ZHE LEI', lastName: 'CONDE', studentNumber: '21-17-043', password: 'default', profilePictureUrl: ''),
      User(firstName: 'RANIELLE', lastName: 'JINGCO', studentNumber: '21-17-213', password: 'default', profilePictureUrl: ''),
      User(firstName: 'IAN JASPER', lastName: 'GONZALO', studentNumber: '20-17-0475', password: 'default', profilePictureUrl: ''),
      User(firstName: 'PAUL CHRISTIAN', lastName: 'GEROLA', studentNumber: '21-17-053', password: 'default', profilePictureUrl: ''),
      User(firstName: 'ALADIN', lastName: 'FAJARDO', studentNumber: '21-17-048', password: 'default', profilePictureUrl: ''),
      User(firstName: 'MARSHALJADE', lastName: 'TEJERO', studentNumber: '21-17-069', password: 'default', profilePictureUrl: ''),
      User(firstName: 'CASTER TROI', lastName: 'AREMADO', studentNumber: '21-17-037', password: 'default', profilePictureUrl: ''),
      User(firstName: 'WILSON', lastName: 'TAMPOS', studentNumber: '21-17-067', password: 'default', profilePictureUrl: ''),
      User(firstName: 'MICHAEL GABRIEL', lastName: 'GUINTO', studentNumber: '21-17-055', password: 'default', profilePictureUrl: ''),
      User(firstName: 'JOSEPH ANDREW', lastName: 'ANCIT', studentNumber: '21-17-204', password: 'default', profilePictureUrl: ''),
      User(firstName: 'IAN CARLO', lastName: 'MEDINA', studentNumber: '21-17-019', password: 'default', profilePictureUrl: ''),
      User(firstName: 'YZABEL', lastName: 'BUITRE', studentNumber: '21-17-005', password: 'default', profilePictureUrl: ''),
      User(firstName: 'DARWIN JOHN', lastName: 'BARLIZO', studentNumber: '21-17-040', password: 'default', profilePictureUrl: ''),
      User(firstName: 'FRANCIS', lastName: 'AUSTRIA', studentNumber: '21-17-038', password: 'default', profilePictureUrl: ''),
      User(firstName: 'MARY JOY', lastName: 'BAUTISTA', studentNumber: '21-17-012', password: 'default', profilePictureUrl: ''),
      User(firstName: 'ALYZZA MARIE', lastName: 'PANAMBITAN', studentNumber: '21-17-063', password: 'default', profilePictureUrl: ''),
      User(firstName: 'CHRISTOPER KENNETH', lastName: 'ARCEO', studentNumber: '21-17-207', password: 'default', profilePictureUrl: ''),
      User(firstName: 'IMIE FLORELYN', lastName: 'TEOLOGO', studentNumber: '21-17-070', password: 'default', profilePictureUrl: ''),
      User(firstName: 'IVAN', lastName: 'LARGO', studentNumber: '21-17-057', password: 'default', profilePictureUrl: ''),
      User(firstName: 'JOHN JOSEPH', lastName: 'QUITO', studentNumber: '21-17-201', password: 'default', profilePictureUrl: ''),
      User(firstName: 'MARK ANGELO', lastName: 'MENES', studentNumber: '21-17-212', password: 'default', profilePictureUrl: ''),
      User(firstName: 'BERNARD', lastName: 'MARCELO', studentNumber: '21-17-015', password: 'default', profilePictureUrl: ''),
      User(firstName: 'NESTOR JOHN', lastName: 'OBA', studentNumber: '21-17-021', password: 'default', profilePictureUrl: ''),
      User(firstName: 'MATHEW JAMES', lastName: 'SALONGA', studentNumber: '21-17-026', password: 'default', profilePictureUrl: ''),
      User(firstName: 'JOHN VINCENT', lastName: 'RULLAN', studentNumber: '21-17-024', password: 'default', profilePictureUrl: ''),
      User(firstName: 'EDWARD', lastName: 'SIMANGAN', studentNumber: '21-17-030', password: 'default', profilePictureUrl: ''),
      User(firstName: 'FRANCINE LEIGH', lastName: 'PAMILOZA', studentNumber: '21-17-202', password: 'default', profilePictureUrl: ''),
      User(firstName: 'CHRISTIAN GENSON', lastName: 'DEOCAREZA', studentNumber: '21-17-007', password: 'default', profilePictureUrl: ''),
      User(firstName: 'RICA', lastName: 'DAMASCO', studentNumber: '21-17-045', password: 'default', profilePictureUrl: ''),
    ];

    bool anyUploaded = false; // Flag to check if any user is uploaded

    for (var user in staticUsers) {
      try {
        var userDoc = await _usersCollection.doc(user.studentNumber).get();
        if (!userDoc.exists) {
          await _usersCollection.doc(user.studentNumber).set(user.toMap());
          print('Uploaded user: ${user.studentNumber}');
          anyUploaded = true; // Mark that at least one user was uploaded
        } else {
          print('User already exists: ${user.studentNumber}');
        }
      } catch (e) {
        print('Failed to upload user ${user.studentNumber}: $e');
      }
    }

    if (!anyUploaded) {
      print('No new users were uploaded to Firestore.');
    } else {
      print('Static users upload completed.');
    }
  }

  // Method to fetch users from Firestore
  static Future<List<User>> fetchUsersFromFirestore() async {
    try {
      QuerySnapshot querySnapshot = await _usersCollection.get();
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return User.fromMap(data);
      }).toList();
    } catch (e) {
      print('Failed to fetch users: $e');
      return [];
    }
  }

  // Method to get a user's profile picture URL from Firestore
  static Future<String?> getProfilePictureUrl(String studentNumber) async {
    try {
      var userDoc = await _usersCollection.doc(studentNumber).get();
      if (userDoc.exists) {
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
        return data['profilePictureUrl'] as String?;
      }
    } catch (e) {
      print('Failed to get profile picture for $studentNumber: $e');
    }
    return null;
  }

  // Method to update a user's profile picture URL in Firestore
  static Future<void> updateProfilePictureUrl(String studentNumber, String url) async {
    try {
      await _usersCollection.doc(studentNumber).update({
        'profilePictureUrl': url,
      });
      print('Profile picture updated for $studentNumber');
    } catch (e) {
      print('Failed to update profile picture for $studentNumber: $e');
    }
  }
}
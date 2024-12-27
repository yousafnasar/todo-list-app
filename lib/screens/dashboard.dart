import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Future<Map<String, dynamic>> _fetchUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return doc.data()!;
      } else {
        throw Exception("User data not found");
      }
    } catch (e) {
      return {
        'name': 'Unknown User',
        'email': 'No Email Available',
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              FutureBuilder<Map<String, dynamic>>(
                future: _fetchUserData(currentUser?.uid ?? ''),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return _buildProfileSection(
                      name: 'Unknown User',
                      email: 'No Email Available',
                    );
                  } else {
                    final userData = snapshot.data!;
                    return _buildProfileSection(
                      name: userData['name'] ?? 'Unknown User',
                      email: userData['email'] ?? 'No Email Available',
                    );
                  }
                },
              ),
              const Spacer(),
              const Text(
                "Good Afternoon",
                style: TextStyle(
                  color: Color(0XBF000000),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Tasks List",
                    style: TextStyle(
                      color: Color(0XBF000000),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                child: _buildTasksSection(),
              ),
              _buildAddTaskSection(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  /// Profile Section
  Widget _buildProfileSection({required String name, required String email}) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 44),
      decoration: const BoxDecoration(
        color: Color(0XAAF4C17F),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            height: 90,
            width: 92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44),
              border: Border.all(
                color: const Color(0XFFD8605B),
                width: 3,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: const Center(
              child: Icon(Icons.person, size: 50, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              color: Color(0XFF000000),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            email,
            style: const TextStyle(
              color: Color(0XFFD8605B),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: double.maxFinite,
            height: 22,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0XFFF4C27F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                await _auth.signOut();
                Get.offAllNamed('/loginscreen');
              },
              child: const Text(
                "Log Out",
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Tasks Section
  Widget _buildTasksSection() {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('tasks').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Error loading tasks"));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No tasks available"));
        }

        final tasks = snapshot.data!.docs;

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            final taskId = task.id;
            final taskData = task.data() as Map<String, dynamic>;

            return ListTile(
              leading: Checkbox(
                value: taskData['isChecked'] ?? false,
                onChanged: (bool? value) {
                  _updateTask(taskId, value ?? false);
                },
              ),
              title: Text(
                taskData['name'] ?? 'Unnamed Task',
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  _deleteTask(taskId); // Corrected delete action
                },
                child: SvgPicture.asset(
                  'assets/icons/icn_close.svg',
                  width: 50,
                  height: 50,
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Add Task Section
  Widget _buildAddTaskSection() {
    final TextEditingController taskController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                hintText: 'Enter task name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              final taskName = taskController.text.trim();
              if (taskName.isNotEmpty) {
                _firestore.collection('tasks').add({
                  'name': taskName,
                  'isChecked': false,
                });
                taskController.clear();
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  /// Firestore Functions
  void _updateTask(String taskId, bool isChecked) {
    _firestore.collection('tasks').doc(taskId).update({'isChecked': isChecked});
  }

  void _deleteTask(String taskId) {
    _firestore.collection('tasks').doc(taskId).delete();
  }
}

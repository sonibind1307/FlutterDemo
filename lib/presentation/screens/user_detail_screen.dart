part of '../../../core/export.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Detail"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60.h),
              CircleAvatarWidget(
                imageUrl: user.avatarUrl,
                radius: 120.r,
              ),
              SizedBox(height: 12.h),
              CustomTextStyle.bold(
                  text: user.login?.toUpperCase() ?? "", fontSize: 20.sp),
              SizedBox(height: 4.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: CustomTextStyle.regular(
                    color: Colors.black87,
                    text: user.nodeId?.toUpperCase() ?? "",
                    fontSize: 14.sp),
              ),
              SizedBox(height: 30.h),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    _buildListTile(
                      icon: Icons.person,
                      text: user.type ?? "",
                      onTap: () {},
                    ),
                    const Divider(height: 0),
                    _buildListTile(
                      icon: Icons.settings,
                      text: "Setting",
                      onTap: () {},
                    ),
                    const Divider(height: 0),
                    _buildListTile(
                      icon: Icons.keyboard_backspace,
                      text: 'Back',
                      iconColor: Colors.red,
                      textColor: Colors.red,
                      onTap: () {
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildListTile({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      // trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

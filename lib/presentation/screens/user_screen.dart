part of '../../core/export.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConnectionBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(
              locator<ApiRepository>(), context.read<ConnectionBloc>()),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
                title: TextField(
              style: TextStyle(fontSize: 16.sp),
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              ),
              onChanged: (query) {
                context.read<UserBloc>().add(SearchUsers(query: query));
              },
            )),
            body: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is LoadingUserState) {
                  return ListView.builder(
                    itemCount: 12, // Number of shimmer rows
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 16.w,
                    ),
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20.r,
                            backgroundColor: Colors.white,
                          ),
                          title: Container(height: 12.h, color: Colors.white),
                          subtitle: Container(
                            height: 10.h,
                            margin: EdgeInsets.only(top: 4.h),
                            color: Colors.white,
                          ),
                          trailing: Container(
                            height: 10.h,
                            width: 20.w,
                            margin: EdgeInsets.only(top: 4.h),
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is SuccessUserState) {
                  //NotificationListener it detects user is near to bottom that is maxScrollExtent - 200
                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels >=
                          scrollInfo.metrics.maxScrollExtent - 200) {
                        context.read<UserBloc>().add(FetchUsers());
                      }
                      return false;
                    },
                    child: ListView.builder(
                      /// state.users.length + 1 use for user to show loader
                      itemCount: state.isLoadingMore
                          ? state.users.length + 1
                          : state.users.length,

                      itemBuilder: (context, index) {
                        if (index < state.users.length) {
                          UserModel userModel = state.users[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.h, horizontal: 4.w),
                            child: ListTile(
                              onTap: () {
                                context.push(routeUserDetail, extra: userModel);
                              },
                              leading: CircleAvatarWidget(
                                  imageUrl: userModel.avatarUrl),
                              title: CustomTextStyle.bold(
                                text: userModel.login?.toUpperCase() ?? "",
                                fontSize: 16.sp,
                              ),
                              subtitle: CustomTextStyle.regular(
                                text: userModel.nodeId ?? "",
                                fontSize: 14.sp,
                              ),
                              trailing: CustomTextStyle.regular(
                                text: userModel.type ?? "",
                                fontSize: 12.sp,
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    ),
                  );
                } else if (state is ErrorUserState) {
                  return Center(
                    child: Container(
                      width: 300.w,
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Internet cloud icon with bolt
                          Icon(
                            Icons.cloud_off,
                            size: 80.sp,
                            color: const Color(0xFF7B83EB),
                          ),
                          SizedBox(height: 24.h),

                          CustomTextStyle.bold(
                              fontSize: 24.sp,
                              text: "Ooops!",
                              color: Colors.grey[600]),
                          SizedBox(height: 12.h),

                          // Message text
                          CustomTextStyle.regular(
                              text: state.error, color: Colors.grey[600]),
                          SizedBox(height: 24.h),

                          // Try Again button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<UserBloc>().add(FetchUsers());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF7B83EB),
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              child: Text(
                                'TRY AGAIN',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }
}

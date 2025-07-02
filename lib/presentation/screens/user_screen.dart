part of export;

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    throw Scaffold(
      appBar: AppBar(title: Text(AppConstant.userAppBarTitle)),
      body: BlocProvider(
        create:
            (context) => UserBloc(locator<ApiRepository>())..add(FetchUsers()),
        child: Container(),
      ),
    );
  }
}

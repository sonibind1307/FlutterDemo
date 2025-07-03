part of '../../core/export.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    super.key,
    required this.imageUrl,
    this.radius,
  });

  final String? imageUrl;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imageUrl ?? '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            );
          },
        );
      },
      child: CircleAvatar(
        radius: radius ?? 25,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? "",
            width: radius == null ? 50 : radius! * 2,
            height: radius == null ? 50 : radius! * 2,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              size: radius ?? 16,
            ),
          ),
        ),
      ),
    );
  }
}

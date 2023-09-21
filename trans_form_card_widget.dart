class TransFormCardWidget extends StatefulWidget {
  /// 돌아가는 카드 위젯
  const TransFormCardWidget({Key? key}) : super(key: key);

  @override
  State<TransFormCardWidget> createState() => _TransFormCardWidgetState();
}

class _TransFormCardWidgetState extends State<TransFormCardWidget>
    with SingleTickerProviderStateMixin {
  AppUtils appUtils = AppUtils();
  late AnimationController controller;
  late Animation<double> animation;
  bool isFront = true;
  double horizontalDrag = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget topContent = SizedBox(
      width: 303.w,
      height: appUtils.getHeight(degineHeight: 322),
      child: Center(
        child: Text('티켓'),
      ),
    );

    Widget bottomContent = SizedBox(
      width: 303.w,
      height: appUtils.getHeight(degineHeight: 134),
      child: Center(
        child: Text('티켓'),
      ),
    );

    void setImageSide() {
      if (horizontalDrag <= 90 || horizontalDrag >= 270) {
        isFront = true;
      } else {
        isFront = false;
      }
    }

    return GestureDetector(
      onTap: () {},
      onHorizontalDragStart: (details) {
        controller.reset();
        setState(() {
          // isFront = true;
          horizontalDrag = isFront ? 0 : 180;
        });
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          horizontalDrag -= details.delta.dx;
          horizontalDrag %= 360;
          setImageSide();
        });
      },
      onHorizontalDragEnd: (details) {
        final double end =
            horizontalDrag < 90 || horizontalDrag > 270 ? 0 : 180;

        animation =
            Tween<double>(begin: horizontalDrag, end: end).animate(controller)
              ..addListener(() {
                setState(() {
                  horizontalDrag = animation.value;
                  // horizontalDrag = 180;
                  // isFront ? horizontalDrag = 0 : horizontalDrag = 180;
                  setImageSide();
                });
              });
        controller.forward();
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(horizontalDrag / 180 * pi),
        alignment: Alignment.center,
        child: isFront
            ? SmartTicketWidget(
                topContent: topContent,
                bottomContent: bottomContent,
                width: 303,
                borderRadius: 20.w,
                punchRadius: 12.w,
                strokeColor: Colors.white.withOpacity(0.2),
              )
            : Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(pi),
                alignment: Alignment.center,
                child: SmartTicketWidget(
                  topContent: topContent,
                  bottomContent: bottomContent,
                  topBoxDecoration: BoxDecoration(color: Colors.red),
                  bottomBoxDecoration: BoxDecoration(color: Colors.red),
                  width: 303,
                  borderRadius: 20.w,
                  punchRadius: 12.w,
                  strokeColor: Colors.white.withOpacity(0.2),
                ),
              ),
      ),
    );
  }
}

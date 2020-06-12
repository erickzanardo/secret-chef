import 'package:flutter/material.dart';
import 'package:flame/widgets/animation_widget.dart';
import '../../widgets/label.dart';
import '../../game/assets.dart';

class SuperWinModal extends StatefulWidget {
  @override
  State createState() => _SuperWinModalState();
}

class _SuperWinModalState extends State<SuperWinModal> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  int _current = 0;
  List<Widget> _steps;

  initState() {
    super.initState();

    _steps = [FirstPanel(), SecondPanel(), ThirdPanel(), ForthPanel()];

    controller = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_current + 1 < _steps.length) {
          Future.delayed(Duration(seconds: 4)).then((_) {
            controller.reverse();
          });
        }
      } else if (status == AnimationStatus.dismissed) {
        if (_current < _steps.length) {
          setState(() {
            _current = _current + 1;
            controller.forward();
          });
        }
      }
    });
    controller.forward();
  }

  @override
  Widget build(ctx) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 10, color: Color(0xFFe3e3e3)),
                color: const Color(0xFF333c57),
            ),
            width: 500,
            height: 300,
            child: FadeTransition(
                opacity: animation,
                child: _steps[_current],
            )
        )
    );
  }
}

class FirstPanel extends StatelessWidget {
  @override
  Widget build(ctx) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Label(label: "Tyemy", fontSize: 45, fontColor: Color(0xFF94b0c2)),
          SizedBox(height: 20),
          Label(label: "Você é minha pequena cereja", fontSize: 25, fontColor: Color(0xFFf4f4f4)),
          SizedBox(height: 10),
          Label(label: "Minha amiga", fontSize: 25, fontColor: Color(0xFFf4f4f4)),
          SizedBox(height: 10),
          Label(label: "Minha parceira", fontSize: 25, fontColor: Color(0xFFf4f4f4)),
          SizedBox(height: 10),
          Label(label: "Meu amor", fontSize: 25, fontColor: Color(0xFFf4f4f4)),
        ],
    );
  }
}

class SecondPanel extends StatelessWidget {
  @override
  Widget build(ctx) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Label(label: "Com você eu posso ser eu mesmo", fontSize: 22, fontColor: Color(0xFFf4f4f4)),
          SizedBox(height: 10),
          Label(label: "Você participa da minhas loucuras", fontSize: 22, fontColor: Color(0xFFf4f4f4)),
          SizedBox(height: 10),
          Label(label: "Me anima quando estou triste", fontSize: 22, fontColor: Color(0xFFf4f4f4)),
          SizedBox(height: 10),
          Label(label: "Cuida de mim quando não estou bem", fontSize: 22, fontColor: Color(0xFFf4f4f4)),
        ],
    );
  }
}

class ThirdPanel extends StatelessWidget {
  @override
  Widget build(ctx) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Label(label: "Você é tudo que eu sempre quis", fontSize: 25, fontColor: Color(0xFFf4f4f4)),
          SizedBox(height: 60),
          Label(label: "E com você comigo", fontSize: 25, fontColor: Color(0xFFf4f4f4)),
          Label(label: "A vida faz sentido", fontSize: 25, fontColor: Color(0xFFf4f4f4)),
        ],
    );
  }
}

class ForthPanel extends StatelessWidget {
  @override
  Widget build(ctx) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Label(label: "Quer se casar comigo?", fontSize: 25, fontColor: Color(0xFFf4f4f4)),
          SizedBox(height: 40),
          Container(
              width: 200,
              height: 150,
              child: AnimationWidget(animation: Assets.cherries),
          ),
        ],
    );
  }
}

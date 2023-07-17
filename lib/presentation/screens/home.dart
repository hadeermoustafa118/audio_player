import 'package:audio/core/utils/app_constants.dart';
import 'package:audio/presentation/components/button_component.dart';
import 'package:audio/presentation/controller/audio_cubit.dart';
import 'package:audio/presentation/controller/audio_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AudioCubit()..setUpFun(),
      child: BlocConsumer<AudioCubit, AudioStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var audio = AudioCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: SizedBox(
                width: context.width*0.38,
                child: Row(
                  children: [
                    const Text(
                      'Now Playing',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    SizedBox(
                      width: context.width * 0.02,
                    ),
                    const Icon(
                      Icons.album_rounded,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent),
            ),
            body: Center(
              child: Column(children: <Widget>[
                SizedBox(
                  height: context.height * 0.04,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(Sizes(context).screenWidth * 0.05),
                  child: Image.asset(
                    AppConstants.selinaImage,
                    height: context.height * 0.5,
                    width: context.width - 20,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.025,
                ),
                const Text(
                  'Calm Down',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: context.height * 0.015,
                ),
                const Text(
                  'Midnight Vibes . 2022',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                ),
                Slider(
                  value: state.position.inSeconds.toDouble() <
                          state.duration.inSeconds.toDouble()
                      ? state.position.inSeconds.toDouble()
                      : 0,
                  onChanged: (value) async {
                    audio.seekTo(value.toInt());
                  },
                  min: 0,
                  max: state.duration.inSeconds.toDouble(),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonComponent(
                        icon: Icons.first_page,
                        onPress: () {
                          audio.seekBackward();
                        },
                      ),
                      ButtonComponent(
                        icon: state.isPlaying ? Icons.pause : Icons.play_arrow,
                        onPress: () {
                          if (state.isPlaying) {
                            audio.stop();
                          } else {
                            audio.play();
                          }
                        },
                      ),
                      ButtonComponent(
                        icon: Icons.last_page,
                        onPress: () {
                          audio.seekForward();
                        },
                      ),
                    ],
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}


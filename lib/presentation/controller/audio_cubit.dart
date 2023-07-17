import 'package:audio/core/utils/app_constants.dart';
import 'package:audio/presentation/controller/audio_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioCubit extends Cubit<AudioStates>{
  AudioCubit():super(AudioStates(audioPlayer: AudioPlayer()));
  static AudioCubit get(BuildContext context) => BlocProvider.of(context);


  setUpFun(){
    state.audioPlayer.onDurationChanged.listen((newDuration){
      emit(state.copyWith(duration : newDuration));
    state.audioPlayer.onPositionChanged.listen((newPosition) {
      emit(state.copyWith(position : newPosition));
      });
    });
  }

  play() async{
    await state.audioPlayer.play(UrlSource(AppConstants.audio));

    emit(state.copyWith(isPlaying : true));
  }
  stop()async{
   await state.audioPlayer.pause();
   emit(state.copyWith(isPlaying : false));
  }
  seekTo(int seconds){
    state.audioPlayer.seek(Duration(seconds: seconds));
    emit(state.copyWith());
  }

  seekForward(){
    if (state.position <
         state.duration - const Duration(seconds: 10)){
      state.audioPlayer.seek(Duration(seconds: state.position.inSeconds +10));
      emit(state.copyWith(position: Duration(seconds: state.position.inSeconds +10) ));
    }
    else{
      state.audioPlayer.seek(Duration(seconds: state.duration.inSeconds));
      state.audioPlayer.stop();
      emit(state.copyWith(position: Duration(seconds: state.duration.inSeconds) ));
    }
  }

  seekBackward(){
    if (state.position.inSeconds == 0 ||
        state.position.inSeconds < 10){
      state.audioPlayer.seek(const Duration(seconds: 0));
      emit(state.copyWith(position: const Duration(seconds:0) ));
    }else if (state.position.inSeconds > 10){
      state.audioPlayer.seek(Duration(seconds: state.position.inSeconds -10));
      emit(state.copyWith(position: Duration(seconds: state.position.inSeconds -10) ));
    }
  }
}

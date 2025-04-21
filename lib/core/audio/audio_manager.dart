import 'package:englishword/core/logger/app_logger.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/subjects.dart';

class AudioManager {
  static AudioManager intance = AudioManager._();

  AudioManager() {
    _handlePlayerStateChanges();
  }

  /// AudioManager 클래스의 생성자
  AudioManager._();

  /// 오디오 플레이어 관련 객체
  final AudioPlayer player = AudioPlayer(); // 오디오 재생을 담당하는 싱글톤 플레이어 객체

  ProcessingState processingState = ProcessingState.idle;

  final BehaviorSubject<bool> _isPlayProcessing = BehaviorSubject.seeded(false);

  void _handlePlayerStateChanges() {
    player.playerStateStream.listen(
      (state) async {
        switch (state.processingState) {
          case ProcessingState.completed:
            break;
          case ProcessingState.ready:
            break;
          case ProcessingState.buffering:
            break;
          case ProcessingState.loading:
            break;
          case ProcessingState.idle:
            break;
          default:
            break;
        }
        logger.d("--------------- 음원 상태: ${state.processingState} ----------------");
      },
      onError: (error) {
        logger.d("AudioManager: playerStateStream 에러 발생: $error");
      },
    );
  }

  Future<void> play(String fileName) async {
    try {
      await _handleActionWithLock(
        processingFlag: _isPlayProcessing,
        action: () async {
          await player.setAudioSource(AudioSource.asset('assets/sound/$fileName.mp3'));
          await player.play();
          logger.d("AudioPlayerHandler: play() 완료");
        },
        actionName: "play",
      );
    } catch (e) {
      logger.d("Error while playing: $e");
    }
  }

  Future<void> stop() async {
    await _handleActionWithLock(
      processingFlag: _isPlayProcessing,
      // stop은 play 상태에 영향을 미칠 수 있으므로 play processing flag 사용
      action: () async {
        if (player.playing) {
          logger.d("AudioPlayerHandler: stop() 호출");
          await player.stop();
          logger.d("AudioPlayerHandler: stop() 완료");
        }
      },
      actionName: "stop",
    );
  }

  Future<void> release() async{
    await player.dispose();
  }

  Future<void> _handleActionWithLock({
    required BehaviorSubject<bool> processingFlag,
    required Future<void> Function() action,
    String? actionName,
  }) async {
    //await _lock.synchronized(() async {
    processingFlag.add(true);
    try {
      logger.d("$actionName 실행 시작.");
      await action();
      logger.d("$actionName 실행 완료.");
    } catch (e) {
      logger.d("$actionName 실행 중 오류 발생: $e");
    } finally {
      processingFlag.add(false);
      logger.d("$actionName 실행 잠금 해제.");
    }
    //});
  }
}

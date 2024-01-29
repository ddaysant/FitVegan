import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../widgets/responsive_layout.dart';

class FitnessScreen extends StatelessWidget {
  const FitnessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.buildScaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(118, 221, 70, 100), Colors.white],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Text(
                  'Let\'s Workout!',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  _buildWorkoutContainer(context, 'Squats', 'assets/img/ft1.png', 'https://youtu.be/xqvCmoLULNY?si=fxtSLmRAxY7BHIVV'),
                  _buildWorkoutContainer(context, 'Glute Bridges', 'assets/img/fit2.png', 'https://youtu.be/XLXGydU5DdU?si=7USdxtCOhkVErsUB'),
                  _buildWorkoutContainer(context, 'Planks', 'assets/img/fit3.png', 'https://youtu.be/yKoPxCsVknQ?si=2nnLGGPIcbDMBuQk'),
                  _buildWorkoutContainer(context, 'Push-ups', 'assets/img/fit4.png', 'https://youtu.be/tWjBnQX3if0?si=umH8sOB93NxCC5VG'),
                  _buildWorkoutContainer(context, 'Side Planks', 'assets/img/fit5.png', 'https://youtu.be/9dNL_mtObGQ?si=To5hwewBoxEmIbM-'),
                  _buildWorkoutContainer(context, 'Wall Sits', 'assets/img/fit6.png', 'https://youtu.be/-cdph8hv0O0?si=HSS4rYgsZ3OggvvY'),
                  _buildWorkoutContainer(context, 'Box Squats', 'assets/img/fit7.png', 'https://youtu.be/QifjltKUMCk?si=4ew-1eO0CdeqPsf6'),
                  _buildWorkoutContainer(context, 'Side Leg Raises', 'assets/img/fit8.png', 'https://youtu.be/jgh6sGwtTwk?si=t70ufKHqt3gigtPP'),
                ],
              ),
            ),
          ],
        ),
      ),
      context: context,
    );
  }

  Widget _buildWorkoutContainer(BuildContext context, String title, String imagePath, String videoUrl) {
    return InkWell(
      onTap: () {
        _openYoutubeVideo(context, videoUrl);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: ResponsiveLayout.isLargeScreen(context) ? 250 : 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                width: ResponsiveLayout.isLargeScreen(context) ? 150 : 100,
                height: ResponsiveLayout.isLargeScreen(context) ? 230 : 180,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time, size: 16),
                  SizedBox(width: 5),
                  Text('20 minutes'),
                  SizedBox(width: 20),
                  Icon(Icons.local_fire_department, size: 16),
                  SizedBox(width: 5),
                  Text('99 calories'),
                ],
              ),
            ),
            const Positioned(
              top: 75,
              left: 0,
              right: 0,
              child: Center(
                child: Icon(Icons.play_circle_fill, size: 50, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openYoutubeVideo(BuildContext context, String videoUrl) {
    try {
      String? videoId = YoutubePlayer.convertUrlToId(videoUrl);
      if (videoId != null) {
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
          ),
        );

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: const Text('Video Player'),
              ),
              body: Center(
                child: YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: const Color.fromARGB(255, 255, 68, 149),
                  progressColors: const ProgressBarColors(
                    playedColor: Color.fromARGB(255, 172, 65, 79),
                    handleColor: Color.fromARGB(255, 255, 68, 93),
                  ),
                  onReady: () {
                    // Video is ready.
                  },
                ),
              ),
            ),
          ),
        );
      } else {
        print('Error: No se pudo obtener el ID del video desde la URL.');
      }
    } catch (e) {
      print('Error al abrir el video: $e');
    }
  }
}

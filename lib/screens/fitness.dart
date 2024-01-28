import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FitnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(118, 221, 70, 100), Colors.white],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
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
                  _buildWorkoutContainer(context, 'Workout 1', '../assets/img/ft1.png', 'https://youtu.be/-5Dxp1MF-IY?feature=shared'),
                  _buildWorkoutContainer(context, 'Workout 2', '../assets/img/fit2.png', 'https://youtu.be/-5Dxp1MF-IY?feature=shared'),
                  _buildWorkoutContainer(context, 'Workout 3', '../assets/img/fit3.png', 'https://youtu.be/-5Dxp1MF-IY?feature=shared'),
                  _buildWorkoutContainer(context, 'Workout 4', '../assets/img/fit4.png', 'https://youtu.be/VIDEO_ID_4'),
                  _buildWorkoutContainer(context, 'Workout 5', '../assets/img/fit5.png', 'https://youtu.be/VIDEO_ID_5'),
                  _buildWorkoutContainer(context, 'Workout 6', '../assets/img/fit6.png', 'https://youtu.be/VIDEO_ID_6'),
                  _buildWorkoutContainer(context, 'Workout 7', '../assets/img/fit7.png', 'https://youtu.be/VIDEO_ID_7'),
                  _buildWorkoutContainer(context, 'Workout 8', '../assets/img/fit8.png', 'https://youtu.be/VIDEO_ID_8'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutContainer(BuildContext context, String title, String imagePath, String videoUrl) {
    return InkWell(
      onTap: () {
        _openYoutubeVideo(context, videoUrl);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: 200, // Altura ajustada
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 180, // Ajusta la altura de la imagen
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
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
            Positioned(
              top: 75,
              left: 0,
              right: 0,
              child: Center(
                child: Icon(Icons.play_circle_fill, size: 50, color: Colors.white), // Icono de reproducción en blanco
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
        YoutubePlayerController _controller = YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
          ),
        );

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Text('Video Player'),
              ),
              body: Center(
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Color.fromARGB(255, 255, 68, 149),
                  progressColors: ProgressBarColors(
                    playedColor: Color.fromARGB(255, 172, 65, 79),
                    handleColor: const Color.fromARGB(255, 255, 68, 93),
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

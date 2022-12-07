import 'package:flutter/material.dart';
import 'package:petize_test/app/features/github_user/presentation/infos_user/widgets/alternative_buttons.dart';
import 'package:petize_test/app/features/github_user/presentation/infos_user/widgets/icon_and_text.dart';

import '../../../../../utils/style.dart';
import '../../../domain/entitites/user.dart';

class InfosUserWidget extends StatelessWidget {
  User user;
  InfosUserWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 14),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(234, 221, 255, 0.6),
      ),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(200.0),
              child: Image.network(
                user.imageUser,
                height: 60.0,
                width: 60.0,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: nameStyleUser,
                ),
                SizedBox(height: 5),
                Text(
                  '@${user.username}',
                  style: defaultStyleInfos,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconText(
              imageUrl: 'assets/images/group_icon.png',
              textIcon: '${user.followers.toString()} seguidores',
            ),
            SizedBox(width: 15),
            IconText(
              imageUrl: 'assets/images/like.png',
              textIcon: '${user.following.toString()} seguindo',
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(user.bio, style: defaultStyleInfos),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              IconText(
                imageUrl: 'assets/images/place.png',
                textIcon: user.company,
              ),
              const SizedBox(width: 15),
              IconText(
                imageUrl: 'assets/images/pin.png',
                textIcon: user.location,
              ),
              const SizedBox(width: 15),
              IconText(
                imageUrl: 'assets/images/email.png',
                textIcon: user.email,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlternativeButtons(
                text: user.blog,
                imageUrl: 'assets/images/link.png',
              ),
              const SizedBox(width: 15),
              AlternativeButtons(
                text: user.twitterUsername,
                imageUrl: 'assets/images/twitter.png',
              ),
            ],
          ),
        ),

        //Text(bloc.user.repositoriesUser[0].name),
      ]),
    );
  }
}

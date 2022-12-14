import 'package:flutter/material.dart';

import '../../../../../utils/style.dart';
import '../../../domain/entitites/user.dart';

class Repositories extends StatelessWidget {
  User user;
  Repositories({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total de repositórios: ${user.repositoriesUser.length}',
            style: defaultStyleInfos,
          ),
        ),
        Column(
          children: List.generate(user.repositoriesUser.length, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.repositoriesUser[index].name,
                    style: nameStyleUser,
                  ),
                  SizedBox(height: 16),
                  Text(
                    user.repositoriesUser[index].description,
                    style: defaultStyleInfos,
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.star_border),
                      SizedBox(width: 5),
                      Text(
                        user.repositoriesUser[index].starsRepository.toString(),
                        style: defaultStyleInfos,
                      ),
                      SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(74, 85, 104, 1),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        user.repositoriesUser[index].updatedAt,
                        style: defaultStyleInfos,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}

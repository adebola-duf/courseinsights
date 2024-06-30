import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(32, 35, 39, .25),
              offset: Offset(0, 4), // changes position of shadow
              spreadRadius: 0,
              blurRadius: 8,
            ),
          ],
          color: const Color.fromARGB(255, 51, 56, 61),
          borderRadius: BorderRadius.circular(8),
        ),
        child: NavigationBar(
          onDestinationSelected: (value) => setState(() {
            _currentPageIndex = value;
          }),
          selectedIndex: _currentPageIndex,
          indicatorColor: Colors.transparent,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.explore_outlined,
                color: Colors.white,
              ),
              icon: Icon(Icons.explore_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
              icon: Icon(Icons.notifications_outlined),
              label: 'Notifications',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
          backgroundColor: Colors.transparent,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(32),
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Ikeokwu Somtochi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications_outlined),
                    Gap(12),
                    CircleAvatar(
                      radius: 22.5,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    )
                  ],
                ),
                const Gap(24),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 203, 207, 210),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 203, 207, 210),
                      ),
                    ),
                  ),
                ),
                const Gap(24),
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Gap(8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (final subject in [
                        'Science',
                        'Art',
                        'Technology',
                        'Commercial',
                        'Something',
                        'Another thing'
                      ])
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SubjectContainer(subjectText: subject),
                        )
                    ],
                  ),
                ),
                const Gap(24),
                const Text(
                  'Top Picks',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < 10; i++)
                        const Padding(
                          padding: EdgeInsets.only(right: 12.0),
                          child: CourseSquareCard(),
                        ),
                    ],
                  ),
                ),
                const Gap(24),
                const Text(
                  'Trending Programs',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(8),
                SizedBox(
                  height: 250,
                  child: ListView(
                    children: [
                      for (int i = 0; i < 4; i++)
                        const Column(
                          children: [
                            CourseHorizontalCard(),
                            Gap(12),
                          ],
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubjectContainer extends StatelessWidget {
  const SubjectContainer({
    super.key,
    required this.subjectText,
  });

  final String subjectText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromARGB(255, 107, 118, 127),
        ),
      ),
      child: Text(
        subjectText,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}

class CourseSquareCard extends StatelessWidget {
  const CourseSquareCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromARGB(255, 107, 118, 127),
        ),
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/neurology.png',
            width: 136,
            height: 114,
          ),
          const Gap(8),
          const Text(
            'Industrial Mathematics',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(2),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star_outline,
                    size: 12,
                  ),
                  Gap(4),
                  Text(
                    '4.8',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Gap(8),
              Row(
                children: [
                  Icon(
                    Icons.visibility_outlined,
                    size: 12,
                  ),
                  Gap(4),
                  Text(
                    '4.8',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Gap(8),
              Row(
                children: [
                  Icon(
                    Icons.bookmark_outline,
                    size: 12,
                  ),
                  Gap(4),
                  Text(
                    '4.8',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseHorizontalCard extends StatelessWidget {
  const CourseHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromARGB(255, 107, 118, 127),
        ),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/chem-engine.png'),
          const Gap(8),
          const Column(
            children: [
              Text(
                'Industrial Mathematics',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star_outline,
                        size: 12,
                      ),
                      Gap(4),
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Gap(8),
                  Row(
                    children: [
                      Icon(
                        Icons.visibility_outlined,
                        size: 12,
                      ),
                      Gap(4),
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Gap(8),
                  Row(
                    children: [
                      Icon(
                        Icons.bookmark_outline,
                        size: 12,
                      ),
                      Gap(4),
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _bottomIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _bottomIndex = index;
    });
  }

  @override
  void initState() {
    _tabController =
        new TabController(length: topics.length, vsync: this, initialIndex: 0);
    super.initState();
  }

  List<String> topics = [
    'All',
    'Flutter',
    'TED Talks',
    'Apple',
    'Computer Science',
    'Technology',
    '3D Modelling'
  ];

  List<Map<String, String>> videos = [
    {
      'Thumbnail': 'assets/rohit.jpg',
      'ChannelArt': 'assets/icc.jpg',
      'Title':
          'Rohit Sharma Hits 140! | India v Pakistan - Match Highlights | ICC Cricket World Cup 2019',
      'ChannelName': 'ICC',
      'Views': '40M views',
      'Upload': '1 year ago',
      'Duration': '4:20'
    },
    {
      'Thumbnail': 'assets/khairiyat.jpg',
      'ChannelArt': 'assets/tseries.jpg',
      'Title':
          'Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh',
      'ChannelName': 'T-Series',
      'Views': '119M views',
      'Upload': '8 months ago',
      'Duration': '3:42'
    },
    {
      'Thumbnail': 'assets/topgear.jpg',
      'ChannelArt': 'assets/topgearlogo.jpg',
      'Title': 'FULL FILM: McLaren Speedtail vs F35 Fighter Jet | Top Gear',
      'ChannelName': 'TopGear',
      'Views': '11M views',
      'Upload': '1 month ago',
      'Duration': '5:23'
    },
    {
      'Thumbnail': 'assets/bean.jpg',
      'ChannelArt': 'assets/oly.jpg',
      'Title': 'Mr. Bean Live Performance at the London 2012 Olympic Games',
      'ChannelName': 'Olympic',
      'Views': '24M views',
      'Upload': '4 years ago',
      'Duration': '10:25'
    },
    {
      'Thumbnail': 'assets/ammy.jpg',
      'ChannelArt': 'assets/tseries.jpg',
      'Title':
          'Ammy Virk: Main Suneya Video Song Feat. Simran Hundal, Rohaan |SunnyV, Raj |Navjit B | Bhushan Kumar',
      'ChannelName': 'T-Series',
      'Views': '40M views',
      'Upload': '4 weeks ago',
      'Duration': '4:37'
    },
    {
      'Thumbnail': 'assets/sophia.png',
      'ChannelArt': 'assets/falcon.png',
      'Title': 'Tonight Showbotics: Jimmy Meets Sophia the Human-Like Robot',
      'ChannelName': 'Jimmy Falcon',
      'Views': '27M views',
      'Upload': '3 years ago',
      'Duration': '39:44'
    },
  ];

  _generateVideos() {
    List<Widget> videosWidgets = List();
    for (int i = 0; i < videos.length; i++) {
      videosWidgets.add(Column(
        children: <Widget>[
          Container(
            height: 200,
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black87),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  child: Text(videos[i]['Duration'],
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(videos[i]['Thumbnail']),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(videos[i]['ChannelArt']),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          videos[i]['Title'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      videos[i]['ChannelName'] +
                          '\t\t' +
                          videos[i]['Views'] +
                          '\t\t' +
                          videos[i]['Upload'],
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                Icon(Icons.more_vert)
              ],
            ),
          )
        ],
      ));
    }
    return videosWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//        backgroundColor: Color(0xFF1A1A1A),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), title: Text('Explore')),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions), title: Text('Subscriptions')),
            BottomNavigationBarItem(
                icon: Icon(Icons.email), title: Text('Inbox')),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library),
                title: Text(
                  'Library',
                )),
          ],
          onTap: _onItemTapped,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          elevation: 20,
          currentIndex: _bottomIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Color(0xff606060),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              elevation: 5,
              backgroundColor: Colors.white,
              title: Image.asset(
                'assets/logo_dark.png',
                height: 22,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.videocam,
                        color: Color(0xff606060),
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.search,
                        color: Color(0xff606060),
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child: Text(
                          'A',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                onTap: (index) {
                  setState(() {
                    _tabController.index = index;
                  });
                },
                tabs: List.generate(
                    topics.length,
                    (index) => Tab(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                topics[index],
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: index == _tabController.index
                                    ? Colors.black54
                                    : Colors.black12,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )),
                labelPadding: EdgeInsets.symmetric(horizontal: 6),
                indicatorWeight: 1,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.white,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 295,
              delegate: SliverChildListDelegate(_generateVideos()),
            )
          ],
        ),
      ),
    );
  }
}
